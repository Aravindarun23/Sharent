//
//  ProductDetailVIew.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 14/05/23.
//

import Foundation
import AppKit

class ProductDetailView: NSView {
    
    let productImage = NSImageView()
    let productImageStack = NSStackView()
    let productScroll = NSScrollView()
    let fromDateButton = NSPopUpButton()
    let toDateButton = NSPopUpButton()
    
   
    override func viewDidMoveToSuperview() {
        wantsLayer = true
        layer?.backgroundColor = .init(red: 0.219607383, green: 0.2196081877, blue: 0.2367719412, alpha: 0.15)
        layer?.cornerRadius = 10
        if superview != nil {
            addProductStackView()
            addProductImage()
        }
    }
    
    func addProductStackView() {
        
        for i in 0...10 {
            if i == 0 {
                configureButton(image: "profile")
            }
            else {
                configureButton(image: "profile")

            }
            
        }
        
        productImageStack.orientation = .vertical
        productScroll.backgroundColor =  .white
        productScroll.contentView = ClipView()
        productScroll.contentView.backgroundColor = #colorLiteral(red: 0.2080558538, green: 0.1834380925, blue: 0.1709060073, alpha: 1)
        productImageStack.spacing = 5
        addSubview(productScroll)
        productScroll.documentView = productImageStack
        productScroll.translatesAutoresizingMaskIntoConstraints = false
        productImageStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productScroll.topAnchor.constraint(equalTo:  topAnchor, constant: 30),
            productScroll.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            productScroll.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productScroll.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    func addProductImage() {
        addSubview(productImage)
        productImage.image = NSImage(named: "profile")
        productImage.isHighlighted = false
        productImage.layer?.backgroundColor = .black
        productImage.isEditable = true
        productImage.refusesFirstResponder = true
        productImage.cell?.isBezeled = false
        productImage.imageScaling = .scaleAxesIndependently
        productImage.wantsLayer = true
        productImage.layer?.backgroundColor = .black
        productImage.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: productScroll.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: productScroll.trailingAnchor, constant: 15),
            productImage.bottomAnchor.constraint(equalTo: productScroll.bottomAnchor),
            productImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.55)
        ])
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
        let image = NSImage(named: image)
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
        
        sender.layer?.backgroundColor = NSColor.systemOrange.cgColor
    }
    
    
//    func addDetailView() {
//
//        let closeButton = NSButton()
//        var image = NSImage(named: "close")
//        image?.size = NSSize(width: 20, height: 20)
//        closeButton.wantsLayer = true
//        closeButton.layer?.cornerRadius = 20
//        closeButton.isBordered = false
//        closeButton.translatesAutoresizingMaskIntoConstraints = false
//        closeButton.image = image
//        view.addSubview(closeButton)
//        closeButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            closeButton.topAnchor.constraint(equalTo: detailView.topAnchor),
//            closeButton.trailingAnchor.constraint(equalTo: detailView.trailingAnchor)
//        ])
//        NSLayoutConstraint.activate([
//            closeButton.widthAnchor.constraint(equalToConstant: 35),
//            closeButton.heightAnchor.constraint(equalToConstant: 35),
//        ])
//
//        let prize = getLabelString(text: "₹ 1200", size: 14)
//        prize.font = .systemFont(ofSize: 25, weight: .bold)
//        prize.textColor = .systemOrange
//        view.addSubview(prize)
//        prize.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            prize.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
//            prize.topAnchor.constraint(equalTo: productImage.topAnchor),
//        ])
//        let productName  = getLabelString(text: "Hundai Exter Seven Seater", size: 16)
//        view.addSubview(productName)
//        productName.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
//            productName.topAnchor.constraint(equalTo: prize.bottomAnchor, constant: 15),
//            productName.widthAnchor.constraint(equalToConstant: 490)
//        ])
//        let productDetail = getLabelString(text: "Then, constraints are added to set the size of the text field to match the size of the childView. These constraints use the leadingAnchor Then, constraints are added to set the size of the text field to match the size of the childView. These constraints use the leadingAnchor constraints are added to set the size of the text field to match the size of the childView. These constraints", size: 13)
//        view.addSubview(productDetail)
//        productDetail.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            productDetail.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
//            productDetail.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 15),
//            productDetail.widthAnchor.constraint(equalToConstant: 500)
//        ])
//
//        let sellerLabel = getLabelString(text: "Seller", size: 20)
//        sellerLabel.textColor =  .systemOrange
//        view.addSubview(sellerLabel)
//        sellerLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            sellerLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
//            sellerLabel.topAnchor.constraint(equalTo: productDetail.bottomAnchor, constant: 15)
//        ])
//
//        let sellerName = getLabelString(text: "Name :  Aravind", size: 13)
//        view.addSubview(sellerName)
//        let address = getLabelString(text: "Address :  140/d pallivassal Street, Pattukkottai", size: 13)
//        view.addSubview(address)
//        sellerName.translatesAutoresizingMaskIntoConstraints = false
//        address.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            sellerName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
//            sellerName.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 10),
//            address.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
//            address.topAnchor.constraint(equalTo: sellerName.bottomAnchor, constant: 10)
//
//        ])
//
//        let availableDatesLabel = getLabelString(text: "Available Dates", size: 20)
//        availableDatesLabel.textColor = .systemOrange
//        view.addSubview(availableDatesLabel)
//        availableDatesLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            availableDatesLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
//            availableDatesLabel.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 15),
//        ])
//
//        let calenderView = NSView()
//        calenderView.wantsLayer = true
//        calenderView.layer?.cornerRadius = 6
//        calenderView.layer?.backgroundColor = .init(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 0.35)
//        calenderView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(calenderView)
//        calenderView.leadingAnchor.constraint(equalTo: productImage.trailingAnchor,constant: 20).isActive = true
//        calenderView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        calenderView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        calenderView.topAnchor.constraint(equalTo: availableDatesLabel.bottomAnchor, constant: 10).isActive = true
//
//        let days = getLabelString(text: "SUN   MON    TUE     WED    THU     FRI      SAT", size: 13)
//        days.textColor = .white
//        calenderView.addSubview(days)
//        days.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            days.topAnchor.constraint(equalTo: calenderView.topAnchor, constant: 5),
//            days.leadingAnchor.constraint(equalTo: calenderView.leadingAnchor, constant: 8),
//            days.trailingAnchor.constraint(equalTo: calenderView.trailingAnchor)
//        ])
//
//        let availableDateView = AvailableDateList()
//        availableDateView.translatesAutoresizingMaskIntoConstraints = false
//        calenderView.addSubview(availableDateView)
//        availableDateView.leadingAnchor.constraint(equalTo: calenderView.leadingAnchor, constant: 5).isActive = true
//        availableDateView.trailingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: -5).isActive = true
//        availableDateView.topAnchor.constraint(equalTo: days.bottomAnchor, constant: 8).isActive = true
//        availableDateView.bottomAnchor.constraint(equalTo: calenderView.bottomAnchor, constant: -5).isActive = true
//
//
//        let availableDateSymbol = getAttributedTextField(text: "  Available", colour: (NSColor(red: 0, green: 1, blue: 0, alpha: 0.5)))
//        view.addSubview(availableDateSymbol)
//        availableDateSymbol.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            availableDateSymbol.topAnchor.constraint(equalTo: availableDateView.topAnchor),
//            availableDateSymbol.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
//        ])
//
//        let notAvailableDateSymbol = getAttributedTextField(text: "  Not Available", colour: (NSColor(red: 1, green: 0, blue: 0, alpha: 0.5)))
//        view.addSubview(notAvailableDateSymbol)
//        notAvailableDateSymbol.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            notAvailableDateSymbol.topAnchor.constraint(equalTo: availableDateSymbol.bottomAnchor, constant: 10),
//            notAvailableDateSymbol.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
//        ])
//
//        let bookDatesLabel = getLabelString(text: "Book Date", size: 17)
//        bookDatesLabel.textColor = .systemOrange
//        view.addSubview(bookDatesLabel)
//        bookDatesLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            bookDatesLabel.topAnchor.constraint(equalTo: notAvailableDateSymbol.bottomAnchor, constant: 20),
//            bookDatesLabel.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
//        ])
//
//        let fromDateLabel = getLabelString(text: "From ", size: 13)
//        view.addSubview(fromDateLabel)
//        fromDateLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            fromDateLabel.topAnchor.constraint(equalTo: bookDatesLabel.bottomAnchor, constant: 20),
//            fromDateLabel.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
//        ])
//
//        addDateTitle(sender: fromDateButton)
//        fromDateButton.isBordered = false
//        fromDateButton.isHighlighted = false
//        fromDateButton.preferredEdge = .maxY
//        fromDateButton.target = self
//        fromDateButton.action = #selector(setToDate(_:))
//        view.addSubview(fromDateButton)
//        fromDateButton.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            fromDateButton.widthAnchor.constraint(equalToConstant: 100),
//            fromDateButton.heightAnchor.constraint(equalToConstant: 14),
//            fromDateButton.leadingAnchor.constraint(equalTo: fromDateLabel.trailingAnchor, constant: 10),
//            fromDateButton.topAnchor.constraint(equalTo: fromDateLabel.topAnchor)
//        ])
//
//
//        let toDateLabel = getLabelString(text: "To ", size: 13)
//        view.addSubview(toDateLabel)
//        toDateLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            toDateLabel.topAnchor.constraint(equalTo: fromDateLabel.bottomAnchor, constant: 25),
//            toDateLabel.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
//        ])
//
//
//        addDateTitle(sender: toDateButton)
//        toDateButton.isBordered = false
//        toDateButton.isHighlighted = false
//        toDateButton.preferredEdge = .maxY
//        toDateButton.isEnabled = false
//        toDateButton.target = self
//        view.addSubview(toDateButton)
//        toDateButton.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            toDateButton.widthAnchor.constraint(equalToConstant: 100),
//            toDateButton.heightAnchor.constraint(equalToConstant: 14),
//            toDateButton.leadingAnchor.constraint(equalTo: fromDateButton.leadingAnchor),
//            toDateButton.topAnchor.constraint(equalTo: toDateLabel.topAnchor)
//        ])
//
//        let numberOfDates = getLabelString(text: "Number Of Dates  :  3 ", size: 11)
//        view.addSubview(numberOfDates)
//        numberOfDates.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            numberOfDates.topAnchor.constraint(equalTo: toDateButton.bottomAnchor, constant: 25),
//            numberOfDates.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
//        ])
//
//        let bookButton = NSButton()
//        bookButton.title = "Book Order"
//        bookButton.wantsLayer = true
//        bookButton.isBordered = false
//        bookButton.alignment = .center
//        bookButton.controlSize = .large
//        bookButton.contentTintColor = .black
//        bookButton.font = .systemFont(ofSize: 12)
//        bookButton.layer?.backgroundColor = NSColor.systemOrange.cgColor
//        bookButton.layer?.cornerRadius = 10
//        view.addSubview(bookButton)
//        bookButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            bookButton.heightAnchor.constraint(equalToConstant: 30),
//            bookButton.widthAnchor.constraint(equalToConstant: 100),
//            bookButton.leadingAnchor.constraint(equalTo: fromDateLabel.trailingAnchor),
//            bookButton.topAnchor.constraint(equalTo: numberOfDates.bottomAnchor, constant: 30)
//        ])
//
//
//    }
    
//    func addDateTitle(sender: NSPopUpButton) {
//        for date in AvailableDateList().totalDates {
//            if !AvailableDateList().bookedDates.contains(date) {
//                sender.addItem(withTitle: date)
//            }
//        }
//    }
//    
//    @objc func setToDate(_ sender: NSButton) {
//        toDateButton.isEnabled = true
//        let index = AvailableDateList().totalDates.firstIndex(of: sender.title)
//        toDateButton.removeAllItems()
//        for date in index!..<AvailableDateList().totalDates.count {
//            if !AvailableDateList().bookedDates.contains(AvailableDateList().totalDates[date]) {
//                toDateButton.addItem(withTitle: AvailableDateList().totalDates[date])
//            }
//            else  {
//                return
//            }
//        }
//    }
//    
    func getLabelString(text: String, size: Int) -> NSTextField {
        
        let textField = NSTextField()
        textField.stringValue = text
        textField.font = .systemFont(ofSize: CGFloat(size))
        textField.isEditable = true
        textField.isSelectable = false
        textField.isBordered = false
        textField.isBezeled = false
        textField.backgroundColor = .clear
        textField.lineBreakMode = .byWordWrapping
        return textField
    }
    
    func getAttributedTextField(text: String, colour: NSColor) -> NSTextField {
        
        var symbolText = NSTextField()
        if let symbolImage = NSImage(systemSymbolName: "circle.fill", accessibilityDescription: nil) {
            let symbolSize = NSSize(width: 20, height: 20)
            symbolImage.size = symbolSize
            let symbolAttachment = NSTextAttachment()
            symbolAttachment.image = symbolImage
            let symbolString = NSAttributedString(attachment: symbolAttachment)
            let textString = NSAttributedString(string: text)
            let attributedString = NSMutableAttributedString(attributedString: symbolString)
            attributedString.append(textString)
            attributedString.addAttribute(.foregroundColor, value: colour, range: NSMakeRange(0, 1))
            attributedString.addAttribute(.font, value: NSFont.systemFont(ofSize: 14), range: NSMakeRange(0, 1))
            attributedString.addAttribute(.foregroundColor, value: NSColor.white, range: NSMakeRange(1, textString.length))
            attributedString.addAttribute(.font, value: NSFont.systemFont(ofSize: 14), range: NSMakeRange(1, textString.length))
            symbolText = NSTextField(labelWithAttributedString: attributedString)
        }
        return symbolText
    }
}

class ClipView: NSClipView {
    override var isFlipped: Bool {
        true
    }
}
