//
//  OrderDetailView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 12/05/23.
//

import Foundation
import AppKit

class DetailView: NSView {
    
    let productImage = NSImageView()
    let productImageStack = NSStackView()
    let detailStackView = NSStackView()
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    override func viewDidMoveToSuperview() {
        configureDetailView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDetailView() {
        addProductImage()
        addProductStackView()
        addDetailView()
    }
    
    func addProductImage() {
        addSubview(productImage)
        productImage.image = NSImage(named: "loginImage")
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
    
    func addProductStackView() {
        
        let productScroll = NSScrollView()
        for i in 0...10 {
            configureButton(image: "loginImage")
        }
        
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
    
    @objc func selectImage(_ sender: NSButton) {
        for button in productImageStack.views {
            button.layer?.backgroundColor = .clear
        }
        sender.layer?.backgroundColor = NSColor.systemOrange.cgColor
        
    }
    
    func configureButton(image: String) {
        let button = NSButton()
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
        var image = NSImage(named: image)
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
    
    func addDetailView() {
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
        let orderDate = getLabelString(text: "Orderdate : 12/01/2002", size: 13)
        let status = getLabelString(text: "Status : confirmed", size: 13)
        let sellerLabel = getLabelString(text: "Seller", size: 18)
        sellerLabel.textColor = .systemOrange
        let sellerName = getLabelString(text: "Name :  Aravind", size: 13)
        let address = getLabelString(text: "Address :  140/d pallivassal Street, Pattukkottai", size: 13)
        detailStackView.spacing = 10
        detailStackView.edgeInsets = NSEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        let mobileNumber = getLabelString(text: "Mobile :  XXXXXXXXXX", size: 13)
        
        let productDetailLabel = getLabelString(text: "Product Detail", size: 18)
        productDetailLabel.textColor = .systemOrange
        
        let detailView = getLabelString(text: "Then, constraints are added to set the size of the text field to match the size of the childView. These constraints use the leadingAnchor, trailingAnchor, topAnchor, and bottomAnchor properties of the text field and childView to align the edges of the text field with the edges of the childView. Note that since the childView is centered within the parentView, the text field will also be centered within the childView.Then, constraints are added to set the size of the text field to match the size of the childView. These constraints use the leadingAnchor, trailingAnchor, topAnchor, and bottomAnchor properties of the text field and childView to align the edges of the text field with the edges of the childView.", size: 13)
        
        let bookedDatesLabel = getLabelString(text: "Booked Dates  (2)", size: 18)
        bookedDatesLabel.textColor = .systemOrange
        
        let bookedDates = getLabelString(text: "23/01/2002 , 27/04/2004", size: 13)
        
        let totalPrizeLabel = getLabelString(text: "Total Prize : (3120)", size: 18)
        totalPrizeLabel.textColor = .systemOrange
        let prize = getLabelString(text: "prize : ₹ 1500  ", size: 13)
        let totaldays = getLabelString(text: "totalDays : 2", size: 13)
        let gst = getLabelString(text: "GST :  12%  (120)", size: 13)
        let totalPrize = getLabelString(text: "Total Prize : ₹ 3120 /-", size: 13)
        let cancelButton = NSButton()
        cancelButton.title = "Cancel Order"
        cancelButton.wantsLayer = true
        cancelButton.isBordered = false
        cancelButton.alignment = .center
        cancelButton.controlSize = .large
        cancelButton.contentTintColor = .black
        cancelButton.font = .systemFont(ofSize: 15)
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
        detailStackView.addArrangedSubview(gst)
        detailStackView.addArrangedSubview(totalPrize)
        detailStackView.addArrangedSubview(cancelButton)
        
        address.translatesAutoresizingMaskIntoConstraints = false
        productDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            address.leadingAnchor.constraint(equalTo: detailStackView.leadingAnchor, constant: 10),
            address.widthAnchor.constraint(equalToConstant: 352),
            detailView.leadingAnchor.constraint(equalTo: detailStackView.leadingAnchor, constant: 10),
            detailView.widthAnchor.constraint(equalToConstant: 352),
            productDetailLabel.topAnchor.constraint(equalTo: mobileNumber.bottomAnchor, constant: 20),
            cancelButton.topAnchor.constraint(equalTo: totalPrize.bottomAnchor, constant: 20)
        ])
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
