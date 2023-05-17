//
//  OrderDetailView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 12/05/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class OrderDetailView: NSView {
    
    let productImage = NSImageView()
    let order: Order
    let productImageStack = NSStackView()
    let detailStackView = NSStackView()
    let alert = NSAlert()
    var cancelOrderPresenter: CancelOrderPresenterContract?
    var numberOfDays = 0
    
    init(cancelOrderPresenter: CancelOrderPresenterContract, order: Order) {
        self.order = order
        self.cancelOrderPresenter = cancelOrderPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            configureDetailView()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDetailView() {
        addProductImage()
        addProductImageStackView()
        addOrderDetailView()
    }
    
   
    func addProductImage() {
        addSubview(productImage)
        if let image = order.product.image {
            productImage.image = NSImage(contentsOf: URL(filePath: image[0]))
        }
        productImage.isEditable = true
        productImage.imageScaling = .scaleProportionallyUpOrDown
        productImage.wantsLayer = true
        productImage.layer?.backgroundColor = .clear
        productImage.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo:  topAnchor, constant: 30),
            productImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -116),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.55)

        ])
    }
    
    func addProductImageStackView() {
        
        let productScroll = NSScrollView()
        if let image = order.product.image {
            for index in 0..<image.count{
                configureButton(image: order.product.image![index], tag: index)
            }
        }
        
        productImageStack.views[0].layer?.backgroundColor = NSColor.systemOrange.cgColor
        productImageStack.orientation = .horizontal
        productScroll.verticalScrollElasticity = .none
        productScroll.backgroundColor =  #colorLiteral(red: 0.2857447863, green: 0.2659823596, blue: 0.2490336299, alpha: 1)
        productImageStack.spacing = 5
        addSubview(productScroll)
        productScroll.documentView = productImageStack
        productScroll.translatesAutoresizingMaskIntoConstraints = false
        productImageStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productScroll.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 15),
            productScroll.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: 20),
            productScroll.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            productScroll.widthAnchor.constraint(equalTo: productImage.widthAnchor, constant: -40),
            productImageStack.topAnchor.constraint(equalTo: productScroll.topAnchor)
        ])
        
    }
    
    func addOrderDetailView() {
        addSubview(detailStackView)
        detailStackView.orientation = .vertical
        detailStackView.alignment = .leading
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.wantsLayer = true
        detailStackView.layer?.cornerRadius = 10
        detailStackView.layer?.backgroundColor = .clear
        NSLayoutConstraint.activate([
            detailStackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            detailStackView.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            detailStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            detailStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        
        ])
        let orderDate = getLabelString(text: "Orderdate : \(order.orderedDate)", size: 13)
        let status = getLabelString(text: "Status : \(order.status)".capitalized, size: 13)
        let sellerLabel = getLabelString(text: "Seller", size: 18)
        sellerLabel.textColor = .systemOrange
        let sellerName = getLabelString(text: "Name :  \(order.product.seller.name)".capitalized, size: 13)
        let address = getLabelString(text: "Address :  \(order.product.seller.address)".capitalized, size: 13)
        detailStackView.spacing = 10
        detailStackView.edgeInsets = NSEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        let mobileNumber = getLabelString(text: "Mobile :  XXXXXXXXXX", size: 13)
        
        let productDetailLabel = getLabelString(text: "Product Detail", size: 18)
        productDetailLabel.textColor = .systemOrange
        
        let detailView = getLabelString(text: order.product.detail  ?? "None".capitalized, size: 13)
        
        let bookedDatesLabel = getLabelString(text: "Booked Dates ", size: 18)
        bookedDatesLabel.textColor = .systemOrange
        
        let bookedDates = getLabelString(text: getDates(fromDate: order.fromDate, toDate: order.returnDate), size: 13)
        
        let totalPrizeLabel = getLabelString(text: "Total Prize", size: 18)
        totalPrizeLabel.textColor = .systemOrange
        let prize = getLabelString(text: "Prize : ₹ \(order.product.price)  ", size: 13)
        let totaldays = getLabelString(text: "Total Days : \(numberOfDays)", size: 13)
        let totalPrize = getLabelString(text: "Total Prize : ₹ \(order.product.price*numberOfDays) /-", size: 13)
        let cancelButton = NSButton()
        cancelButton.title = "Cancel Order"
        cancelButton.wantsLayer = true
        cancelButton.isBordered = false
        cancelButton.alignment = .center
        cancelButton.controlSize = .large
        cancelButton.contentTintColor = .black
        cancelButton.font = .systemFont(ofSize: 16)
        cancelButton.layer?.backgroundColor = NSColor.systemOrange.cgColor
        cancelButton.layer?.cornerRadius = 10
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.heightAnchor.constraint(equalToConstant: 35),
            cancelButton.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        detailStackView.addArrangedSubview(status)
        detailStackView.addArrangedSubview(orderDate)
        detailStackView.addArrangedSubview(sellerLabel)
        detailStackView.addArrangedSubview(sellerName)
        detailStackView.addArrangedSubview(address)
        detailStackView.addArrangedSubview(mobileNumber)
        detailStackView.addArrangedSubview(productDetailLabel)
        detailStackView.addArrangedSubview(detailView)
        detailStackView.addArrangedSubview(bookedDatesLabel)
        detailStackView.addArrangedSubview(bookedDates)
        detailStackView.addArrangedSubview(totalPrizeLabel)
        detailStackView.addArrangedSubview(prize)
        detailStackView.addArrangedSubview(totaldays)
        detailStackView.addArrangedSubview(totalPrize)
        if order.status == .confirmed || order.status == .requested {
            detailStackView.addArrangedSubview(cancelButton)
            cancelButton.translatesAutoresizingMaskIntoConstraints = false
            cancelButton.topAnchor.constraint(equalTo: totalPrize.bottomAnchor, constant: 20).isActive = true
        }
        
        alert.messageText = order.product.name
        alert.informativeText = "Press \"OK\" To Cancel Order"
        alert.alertStyle = .informational
        if let productImage = order.product.image {
            alert.icon = NSImage(contentsOf: URL(filePath: productImage[0]))
        }
        cancelButton.target = self
        cancelButton.action = #selector(cancelOrderAlert)
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        
        address.translatesAutoresizingMaskIntoConstraints = false
        productDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        bookedDates.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            address.widthAnchor.constraint(equalToConstant: 352),
            detailView.widthAnchor.constraint(equalToConstant: 352),
            bookedDates.widthAnchor.constraint(equalToConstant: 352),
            productDetailLabel.topAnchor.constraint(equalTo: mobileNumber.bottomAnchor, constant: 20),
        ])
    }
    
    private func getDates(fromDate: String, toDate: String) -> String {
        var dates = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let startDate = dateFormatter.date(from: fromDate)!
        let endDate = dateFormatter.date(from: toDate)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        numberOfDays = components.day!+1

        if numberOfDays > 0 {
            var currentDate = startDate
           
            while currentDate <= endDate {
                dates += "\(dateFormatter.string(from: currentDate)),  "
                currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
            }
        }
        return dates
    }

    
    @objc func cancelOrderAlert() {
        let modalResult = alert.runModal()
            if modalResult == .alertFirstButtonReturn {
                print("yes")
                cancelOrderPresenter?.viewDidLoad(orderId: order.id)
            }
    }
    
    func configureButton(image: String, tag: Int) {
        let button = NSButton()
        button.tag = tag
        button.wantsLayer = true
        button.target = self
        button.action = #selector(selectImage(_:))
        let imageView = NSImageView()
        button.addSubview(imageView)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
         button.widthAnchor.constraint(equalToConstant: 70),
            button.heightAnchor.constraint(equalToConstant: 70),
        ])
        let image = NSImage(contentsOf: URL(filePath: image))
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 5).isActive = true
        imageView.topAnchor.constraint(equalTo: button.topAnchor, constant: 5).isActive = true
        button.wantsLayer = true
        button.isBordered = false
        button.title = ""
        productImageStack.addArrangedSubview(button)
     }
    
    
    @objc func selectImage(_ sender: NSButton) {
        for button in productImageStack.views {
            button.layer?.backgroundColor = .clear
        }
        productImage.image = NSImage(contentsOf:  URL(filePath: order.product.image![sender.tag]))
        sender.layer?.backgroundColor = NSColor.systemOrange.cgColor
        
    }
    
    
    func getLabelString(text: String, size: Int) -> NSTextField {
        
        let textField = NSTextField()
        textField.stringValue = text
        textField.font = .systemFont(ofSize: CGFloat(size))
        textField.isEditable = false
        textField.isSelectable = false
        textField.isBordered = false
        textField.isBezeled = false
        textField.backgroundColor = .clear
        return textField
    }
    
}


extension OrderDetailView: CancelOrderViewContract {
    func load(message: String) {
        (superview as! OrderListView).viewDidMoveToSuperview()
    }
}
