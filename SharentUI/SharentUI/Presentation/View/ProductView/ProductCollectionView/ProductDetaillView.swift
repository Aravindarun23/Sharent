//
//  ProductDetailVIew.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 14/05/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class ProductDetailView: NSView {
    
    let productImage = NSImageView()
    let productImageStack = NSStackView()
    let productScroll = NSScrollView()
    let fromDateButton = NSPopUpButton()
    let toDateButton = NSPopUpButton()
    var numberOfDates = NSTextField()
    var totalPrize = NSTextField()
    let alert = NSAlert()
    let availableDateView: ProductBookedDatesView
    let placeOrderPresenter: PlaceOrderPresenterContract
    let product: Product
    let user: User
    
    init(product: Product, placeOrderPresenter: PlaceOrderPresenter, user: User) {
        self.product = product
        self.placeOrderPresenter = placeOrderPresenter
        self.user = user
        self.availableDateView = Assembler.getProductBookedDateView(product: product)
        super.init(frame: NSRect())
        wantsLayer = true
        layer?.backgroundColor = .init(red: 0.219607383, green: 0.2196081877, blue: 0.2367719412, alpha: 0.15)
        layer?.cornerRadius = 10
        availableDateView.detailViewDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
        
        if superview != nil {
            addProductStackView()
            addProductImage()
            addDetailView() 
        }
    }
    
    func addProductStackView() {
        
        if let image = product.image {
            for index in 0..<image.count {
                configureButton(image: product.image![index], tag: index)
            
            }
        }
        
        productImageStack.views[0].layer?.backgroundColor = NSColor.systemOrange.cgColor
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
        if let image = product.image {
            productImage.image = NSImage(contentsOf: URL(filePath: image[0]))
        }
        
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
        
        sender.layer?.backgroundColor = NSColor.systemOrange.cgColor
        productImage.image = NSImage(contentsOf: URL(filePath: product.image![sender.tag]))
    }
    
    @objc func closeDetailView() {
        (superview as? ProductListView)?.closeButtonClicked()
    }
    
    func addDetailView() {

        let closeButton = NSButton()
        let image = NSImage(named: "close")?.tint(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        image?.size = NSSize(width: 15, height: 15)
        closeButton.isBordered = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.image = image
        closeButton.target = self
        closeButton.action = #selector(closeDetailView)
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 35),
            closeButton.heightAnchor.constraint(equalToConstant: 35),
        ])

        let prize = getLabelString(text: "₹ \(product.price)", size: 14)
        prize.font = .systemFont(ofSize: 25, weight: .bold)
        prize.textColor = .systemOrange
        addSubview(prize)
        prize.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prize.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            prize.topAnchor.constraint(equalTo: productImage.topAnchor),
        ])
        let productName  = getLabelString(text: product.name, size: 16)
        addSubview(productName)
        productName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productName.topAnchor.constraint(equalTo: prize.bottomAnchor, constant: 15),
            productName.widthAnchor.constraint(equalToConstant: 490)
        ])
        let productDetail = getLabelString(text: product.detail ?? "None", size: 13)
        addSubview(productDetail)
        productDetail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productDetail.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productDetail.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 15),
            productDetail.widthAnchor.constraint(equalToConstant: 500)
        ])

        let sellerLabel = getLabelString(text: "Seller", size: 20)
        sellerLabel.textColor =  .systemOrange
        addSubview(sellerLabel)
        sellerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sellerLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            sellerLabel.topAnchor.constraint(equalTo: productDetail.bottomAnchor, constant: 15)
        ])

        let sellerName = getLabelString(text: "Name :  \(product.seller.name)".capitalized, size: 13)
        addSubview(sellerName)
        let address = getLabelString(text: "Address :  \(product.seller.address)".capitalized, size: 13)
        addSubview(address)
        sellerName.translatesAutoresizingMaskIntoConstraints = false
        address.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sellerName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            sellerName.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 10),
            address.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            address.topAnchor.constraint(equalTo: sellerName.bottomAnchor, constant: 10)

        ])

        let availableDatesLabel = getLabelString(text: "Available Dates", size: 20)
        availableDatesLabel.textColor = .systemOrange
        addSubview(availableDatesLabel)
        availableDatesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            availableDatesLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            availableDatesLabel.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 15),
        ])

        let calenderView = NSView()
        calenderView.wantsLayer = true
        calenderView.layer?.cornerRadius = 6
        calenderView.layer?.backgroundColor = .init(red: 0.250980407, green: 0.250980407, blue: 0.250980407, alpha: 0.35)
        calenderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(calenderView)
        calenderView.leadingAnchor.constraint(equalTo: productImage.trailingAnchor,constant: 20).isActive = true
        calenderView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        calenderView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        calenderView.topAnchor.constraint(equalTo: availableDatesLabel.bottomAnchor, constant: 20).isActive = true

        let days = getLabelString(text: "SUN   MON    TUE     WED    THU     FRI      SAT", size: 13)
        days.textColor = .white
        calenderView.addSubview(days)
        days.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            days.topAnchor.constraint(equalTo: calenderView.topAnchor, constant: 5),
            days.leadingAnchor.constraint(equalTo: calenderView.leadingAnchor, constant: 8),
            days.trailingAnchor.constraint(equalTo: calenderView.trailingAnchor)
        ])

        
        availableDateView.translatesAutoresizingMaskIntoConstraints = false
        calenderView.addSubview(availableDateView)
        availableDateView.leadingAnchor.constraint(equalTo: calenderView.leadingAnchor, constant: 5).isActive = true
        availableDateView.trailingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: -5).isActive = true
        availableDateView.topAnchor.constraint(equalTo: days.bottomAnchor, constant: 8).isActive = true
        availableDateView.bottomAnchor.constraint(equalTo: calenderView.bottomAnchor, constant: -5).isActive = true


        let availableDateSymbol = getAttributedTextField(text: "  Available", colour: (NSColor(red: 0, green: 1, blue: 0, alpha: 0.5)))
        addSubview(availableDateSymbol)
        availableDateSymbol.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            availableDateSymbol.topAnchor.constraint(equalTo: availableDateView.topAnchor),
            availableDateSymbol.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
        ])

        let notAvailableDateSymbol = getAttributedTextField(text: "  Not Available", colour: (NSColor(red: 1, green: 0, blue: 0, alpha: 0.5)))
        addSubview(notAvailableDateSymbol)
        notAvailableDateSymbol.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notAvailableDateSymbol.topAnchor.constraint(equalTo: availableDateSymbol.bottomAnchor, constant: 10),
            notAvailableDateSymbol.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
        ])

        let bookDatesLabel = getLabelString(text: "Book Date", size: 17)
        bookDatesLabel.textColor = .systemOrange
        addSubview(bookDatesLabel)
        bookDatesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookDatesLabel.topAnchor.constraint(equalTo: notAvailableDateSymbol.bottomAnchor, constant: 20),
            bookDatesLabel.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
        ])

        let fromDateLabel = getLabelString(text: "From ", size: 13)
        addSubview(fromDateLabel)
        fromDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fromDateLabel.topAnchor.constraint(equalTo: bookDatesLabel.bottomAnchor, constant: 20),
            fromDateLabel.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
        ])

        fromDateButton.isBordered = false
        fromDateButton.isHighlighted = false
        fromDateButton.preferredEdge = .maxY
        fromDateButton.target = self
        fromDateButton.action = #selector(setToDate(_:))
        addSubview(fromDateButton)
        fromDateButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            fromDateButton.widthAnchor.constraint(equalToConstant: 100),
            fromDateButton.heightAnchor.constraint(equalToConstant: 14),
            fromDateButton.leadingAnchor.constraint(equalTo: fromDateLabel.trailingAnchor, constant: 10),
            fromDateButton.topAnchor.constraint(equalTo: fromDateLabel.topAnchor)
        ])


        let toDateLabel = getLabelString(text: "To ", size: 13)
        addSubview(toDateLabel)
        toDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toDateLabel.topAnchor.constraint(equalTo: fromDateLabel.bottomAnchor, constant: 25),
            toDateLabel.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
        ])

        toDateButton.isBordered = false
        toDateButton.isHighlighted = false
        toDateButton.preferredEdge = .maxY
        toDateButton.isEnabled = false
        toDateButton.target = self
        toDateButton.action = #selector(setTotalDates(_:))
        toDateButton.target = self
        addSubview(toDateButton)
        toDateButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            toDateButton.widthAnchor.constraint(equalToConstant: 100),
            toDateButton.heightAnchor.constraint(equalToConstant: 14),
            toDateButton.leadingAnchor.constraint(equalTo: fromDateButton.leadingAnchor),
            toDateButton.topAnchor.constraint(equalTo: toDateLabel.topAnchor)
        ])

        numberOfDates = getLabelString(text: "Number Of Dates  :  1", size: 12)
        addSubview(numberOfDates)
        numberOfDates.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfDates.topAnchor.constraint(equalTo: toDateButton.bottomAnchor, constant: 25),
            numberOfDates.leadingAnchor.constraint(equalTo: calenderView.trailingAnchor, constant: 20)
        ])
        
        totalPrize = getLabelString(text: "Total Prize  : ₹ \(product.price)", size: 12)
        addSubview(totalPrize)
        totalPrize.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalPrize.topAnchor.constraint(equalTo: numberOfDates.bottomAnchor, constant: 25),
            totalPrize.leadingAnchor.constraint(equalTo: numberOfDates.leadingAnchor)
        ])

        let bookButton = NSButton()
        bookButton.title = "Book Order"
        bookButton.wantsLayer = true
        bookButton.isBordered = false
        bookButton.alignment = .center
        bookButton.controlSize = .large
        bookButton.contentTintColor = .black
        bookButton.font = .systemFont(ofSize: 16)
        bookButton.layer?.backgroundColor = NSColor.systemOrange.cgColor
        bookButton.layer?.cornerRadius = 10
        addSubview(bookButton)
        bookButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookButton.heightAnchor.constraint(equalToConstant: 30),
            bookButton.widthAnchor.constraint(equalToConstant: 130),
            bookButton.leadingAnchor.constraint(equalTo: toDateLabel.leadingAnchor),
            bookButton.topAnchor.constraint(equalTo: totalPrize.bottomAnchor, constant: 30)
        ])
        
        alert.messageText = product.name
        alert.informativeText = "Press \"OK\" To Confirm Order"
        alert.alertStyle = .informational
        if let productImage = product.image {
            alert.icon = NSImage(contentsOf: URL(filePath: productImage[0]))
        }
        bookButton.target = self
        bookButton.action = #selector(bookProductAlert)
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")

    }
    
    @objc func bookProductAlert() {
        let modalResult = alert.runModal()
            if modalResult == .alertFirstButtonReturn {
                placeOrderPresenter.viewDidLoad(productId: product.id, buyerId: user.id , fromDate: fromDateButton.title, toDate: toDateButton.title)
            }
    }
    
    func configurePopUpDates() {
        addDateTitle(sender: fromDateButton)
        addDateTitle(sender: toDateButton)
    }
    
    func addDateTitle(sender: NSPopUpButton) {
        for date in availableDateView.totalDates {
            if !availableDateView.bookedDates.contains(date) {
                sender.addItem(withTitle: date)
            }
        }
    }
    
    @objc func setTotalDates(_ sender: NSButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let startDate = dateFormatter.date(from: fromDateButton.title)!
        let endDate = dateFormatter.date(from: toDateButton.title)!

        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        let numberOfDays = components.day!
        numberOfDates.stringValue = "Number Of Dates  :  \(numberOfDays+1)"
        let totalPrize = (numberOfDays+1)*product.price
        self.totalPrize.stringValue = "Total Prize  : ₹ \(totalPrize)"
        availableDateView.selectedDates = getSelectedDates(fromDate: fromDateButton.title, toDate: toDateButton.title)
        availableDateView.collectionView.reloadData()
    }
    
    @objc func setToDate(_ sender: NSButton) {
        toDateButton.isEnabled = true
        let index = availableDateView.totalDates.firstIndex(of: sender.title)
        toDateButton.removeAllItems()
        for date in index!..<availableDateView.totalDates.count {
            if !availableDateView.bookedDates.contains(availableDateView.totalDates[date]) {
                toDateButton.addItem(withTitle: availableDateView.totalDates[date])
            }
            else  {
                availableDateView.selectedDates = [sender.title]
                availableDateView.collectionView.reloadData()
                return
            }
        }
        availableDateView.selectedDates = [sender.title]
        availableDateView.collectionView.reloadData()
    }
    
    
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
    
    private func getSelectedDates(fromDate: String, toDate: String) -> [String] {
        
        var selectedDates = [String]()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormatter.date(from: fromDate)!
        let endDate = dateFormatter.date(from: toDate)!
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        let numberOfDays = components.day!
        if numberOfDays >= 0 {
            var currentDate = startDate
            
            while currentDate <= endDate {
                selectedDates.append(dateFormatter.string(from: currentDate))
                currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
            }
        }
        return selectedDates
    }
}

class ClipView: NSClipView {
    override var isFlipped: Bool {
        true
    }
}

extension ProductDetailView: PlaceOrderViewContract {
    func load(message: String) {
        (superview as? ProductListView)?.viewDidMoveToSuperview()
        (superview as? ProductListView)?.closeButtonClicked()
    }
}
