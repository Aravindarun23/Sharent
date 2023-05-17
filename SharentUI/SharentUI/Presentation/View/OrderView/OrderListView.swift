//
//  GetMyOrderListVIew.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class OrderListView: NSView {
    
    let user: User
    let leftView = NSView()
    var detailView: OrderDetailView!
    let scrollView = NSScrollView()
    let tableView = NSTableView()
    var filterButton = NSButton()
    var filterMenu = NSMenu()
    var orders = [Order]()
    var searchedOrders = [Order]()
    var selectedRow = 0
    
    let getOrderListPresenter: GetOrderListPresenterContract
    
    init(getOrderListPresenter: GetOrderListPresenterContract, user: User) {
        self.getOrderListPresenter = getOrderListPresenter
        self.user = user
        super.init(frame: NSRect())
        setOrderScrollView()
        setOrderTableView()
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            getOrderListPresenter.viewDidLoad(userId: user.id)
        }
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOrderScrollView() {
        
        addSubview(leftView)
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.wantsLayer = true
        leftView.layer?.cornerRadius = 10
        leftView.layer?.backgroundColor = .init(red: 0.219607383, green: 0.2196081877, blue: 0.2367719412, alpha: 0.15)

        NSLayoutConstraint.activate([
            leftView.topAnchor.constraint(equalTo: topAnchor),
            leftView.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftView.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30),

        ])


        let orderLabel = NSTextField(labelWithString: "Orders")
        orderLabel.font = .systemFont(ofSize: 23)
        orderLabel.textColor = .systemOrange
        leftView.addSubview(orderLabel)
        orderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderLabel.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 10),
            orderLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 20)

        ])
        
//        filterButton = NSButton(frame: NSRect(x: 0, y: 0, width: 100, height: 30))
//        filterButton.title = "Button"
//        filterButton.target = self
//        filterButton.action = #selector(buttonClicked(_:))
//        addSubview(filterButton)
//
//        filterMenu = NSMenu()
//        filterMenu.addItem(withTitle: "Option 1", action: #selector(menuItemSelected(_:)), keyEquivalent: "")
//        filterMenu.addItem(withTitle: "Option 2", action: #selector(menuItemSelected(_:)), keyEquivalent: "")
//        filterMenu.addItem(withTitle: "Option 3", action: #selector(menuItemSelected(_:)), keyEquivalent: "")
//
//        filterButton.menu =  filterMenu
//
//        filterButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            filterButton.topAnchor.constraint(equalTo: topAnchor),
//            filterButton.trailingAnchor.constraint(equalTo: centerXAnchor)
//        ])
        scrollView.hasVerticalScroller = true
                scrollView.translatesAutoresizingMaskIntoConstraints = false
                scrollView.wantsLayer = true
                scrollView.hasVerticalScroller = false

                leftView.addSubview(scrollView)
        
        let scrollViewConstraints = [
            scrollView.leadingAnchor.constraint(equalTo: leftView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: orderLabel.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: leftView.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: leftView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(scrollViewConstraints)
    }
    
//    @objc func buttonClicked(_ sender: NSButton) {
//        filterMenu.popUp(positioning: nil, at: NSEvent.mouseLocation, in: nil)
//    }
//
//    @objc func menuItemSelected(_ sender: NSMenuItem) {
//        
//    }
    
    func setOrderTableView() {
        tableView.backgroundColor = #colorLiteral(red: 0.2127456963, green: 0.1832507551, blue: 0.170811832, alpha: 1)
        tableView.gridStyleMask = .solidHorizontalGridLineMask
        tableView.gridColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.headerView = nil
        tableView.selectionHighlightStyle = .regular
        let column1 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("column1"))
        tableView.addTableColumn(column1)
        scrollView.documentView = tableView
    }
    
    func searchOrder(name: String) {
        if name == "" {
            selectedRow = 0
            searchedOrders = orders
            tableView.reloadData()
        }
        else {
            selectedRow = 0
            searchedOrders = []
            for order in orders {
                if order.product.name.insensitiveContains(name) {
                    searchedOrders.append(order)
                }
            }
            tableView.reloadData()
        }
    }
    
}

extension OrderListView: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) ->   NSView? {
        
        if tableColumn?.identifier.rawValue == "column1" {
            guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: OrderCellView.identifier), owner: self) as? OrderCellView else {
                
                let cell =  OrderCellView()
                
                if let image = searchedOrders[row].product.image {
                    cell.productImage.image = NSImage(contentsOf: URL(filePath: image[0]))
                }
                else {
                    cell.productImage.image = NSImage(named: "")
                }
                
                cell.identifier = NSUserInterfaceItemIdentifier(OrderCellView.identifier)
                cell.productName.stringValue = searchedOrders[row].product.name
                
                let sellerName = searchedOrders[row].product.seller.name
                let status = searchedOrders[row].status
                let orderDate = searchedOrders[row].orderedDate
                
                cell.sellerName.stringValue = "seller: \(sellerName)".capitalized
                cell.orderDate.stringValue = "\(orderDate)"
                
                if status == .confirmed {
                    cell.status.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                }
                else if status == .requested {
                    cell.status.textColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                }
                else if status == .completed {
                    cell.status.textColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                }
                else if status == .cancelled {
                    cell.status.textColor = #colorLiteral(red: 0.8585699201, green: 0.1507412493, blue: 0.2284089923, alpha: 1)
                }
                cell.status.stringValue = "\(status)".uppercased()
                return cell
            }
            
            
            if let image = searchedOrders[row].product.image {
                cell.productImage.image = NSImage(contentsOf: URL(filePath: image[0]))
            } else {
                cell.productImage.image = NSImage(named: "")
            }
            
            let sellerName = searchedOrders[row].product.seller.name
            let status = searchedOrders[row].status
            let orderDate = searchedOrders[row].orderedDate
            
            cell.productName.stringValue = searchedOrders[row].product.name
            cell.sellerName.stringValue = "seller: \(sellerName)".capitalized
            cell.orderDate.stringValue = "\(orderDate)"
            
            
            if status == .confirmed {
                cell.status.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
            else if status == .requested {
                cell.status.textColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            }
            else if status == .completed {
                cell.status.textColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            }
            else if status == .cancelled {
                cell.status.textColor = #colorLiteral(red: 0.8585699201, green: 0.1507412493, blue: 0.2284089923, alpha: 1)
            }
            cell.status.stringValue = ("\(status)").uppercased()
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
           let rowView = CustomTableRowView()
           return rowView
    }
    
    func tableView(_ tableView: NSTableView, didAdd rowView: NSTableRowView, forRow row: Int) {
        
            tableView.selectRowIndexes(IndexSet(integer: selectedRow), byExtendingSelection: false)
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if tableView.selectedRow >= 0 {
            selectedRow = tableView.selectedRow
            if let productDetailView = detailView {
                productDetailView.removeFromSuperview()
            }
            detailView = Assembler.getOrderDetailView(order: searchedOrders[tableView.selectedRow])
            addSubview(detailView)
            detailView.translatesAutoresizingMaskIntoConstraints = false
            detailView.wantsLayer = true
            detailView.layer?.cornerRadius = 10
            detailView.layer?.backgroundColor = .init(red: 0.219607383, green: 0.2196081877, blue: 0.2367719412, alpha: 0.15)
            NSLayoutConstraint.activate([
                detailView.topAnchor.constraint(equalTo: leftView.topAnchor),
                detailView.bottomAnchor.constraint(equalTo: leftView.bottomAnchor),
                detailView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 30),
                detailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)

            ])
        }
    }
}

extension OrderListView: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        searchedOrders.count
    }
}

extension OrderListView: GetOrderListViewContract {
    func load(orders: [Order]) {
        self.orders = orders
        self.searchedOrders = orders
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error)
    }
}
