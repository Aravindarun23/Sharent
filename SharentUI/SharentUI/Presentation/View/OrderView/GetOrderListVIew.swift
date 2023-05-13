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
    
    let leftView = NSView()
    let detailView = DetailView()
    let orderLabel = NSTextField(labelWithString: "Orders")
    let scrollView = NSScrollView()
    let tableView = NSTableView()
    var orders = [Order]()
    
    let getOrderListPresenter: GetOrderListPresenterContract
    
    init(getOrderListPresenter: GetOrderListPresenterContract) {
        self.getOrderListPresenter = getOrderListPresenter
        super.init(frame: NSRect())
        setScrollView()
        setTableView()
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            getOrderListPresenter.viewDidLoad(userId: 2)
        }
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setScrollView() {
        
        addSubview(leftView)
        leftView.addSubview(orderLabel)
        orderLabel.font = .systemFont(ofSize: 23)
        orderLabel.translatesAutoresizingMaskIntoConstraints = false
        orderLabel.textColor = .systemOrange
        
        NSLayoutConstraint.activate([
            orderLabel.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 10),
            orderLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 20)
        
        ])
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
    
    func setTableView() {
        tableView.backgroundColor = #colorLiteral(red: 0.2127456963, green: 0.1832507551, blue: 0.170811832, alpha: 1)
        tableView.gridStyleMask = .solidHorizontalGridLineMask
        tableView.gridColor = .clear
        tableView.allowsMultipleSelection = true
        tableView.intercellSpacing = NSSize(width: 20, height: 20)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.headerView = nil
        tableView.selectionHighlightStyle = .regular
        let column1 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("column1"))
        tableView.addTableColumn(column1)
        scrollView.documentView = tableView
    }
}

extension OrderListView: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) ->   NSView? {
        
        if tableColumn?.identifier.rawValue == "column1" {
            guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: OrderCellView.identifier), owner: self) as? OrderCellView else {
                let cell =  OrderCellView()
                cell.productImage.image = NSImage(named: "boy")
                cell.identifier = NSUserInterfaceItemIdentifier(OrderCellView.identifier)
                cell.productName.stringValue = "Hyundai Exter"
                
                return cell
            }
            cell.productImage.image = NSImage(named: "boy")
            cell.productName.stringValue = "Hyundai Exter"
            
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
           let rowView = CustomTableRowView()
           return rowView
    }
    
    func tableView(_ tableView: NSTableView, didAdd rowView: NSTableRowView, forRow row: Int) {
        if row == 0 {
            tableView.selectRowIndexes(IndexSet(integer: row), byExtendingSelection: false)
        }
    }

}

extension OrderListView: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        10
    }
}

extension OrderListView: GetOrderListViewContract {
    func load(orders: [Order]) {
        self.orders = orders
    }
    
    func failure(error: Error) {
        print(error)
    }
}
