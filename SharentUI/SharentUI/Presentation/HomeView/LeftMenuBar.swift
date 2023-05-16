//
//  LeftMenuBar.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/05/23.
//

import Foundation
import AppKit

class LeftMenuBar: NSView {
    
    var productButton: NSButton!
    var orderButton: NSButton!
    var chatButton: NSButton!
    var walletButton: NSButton!
    var favouriteButton: NSButton!
    var stackView: NSStackView!
    var themeButton: NSButton!
    var moduleChangeDelegate: HomeViewController?
    
    enum Module: Int {
        case product
        case order
        case favourite
        case chat
        case wallet
    }
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        updateMenuBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateMenuBar() {
        
        productButton = configureButton(logo: "product", tag: Module.product.rawValue)
        productButton.layer?.backgroundColor = NSColor.systemOrange.cgColor
        productButton.image = productButton.image?.tint(color: .black)
        orderButton = configureButton(logo: "cart", tag: Module.order.rawValue)
        chatButton = configureButton(logo: "chat", tag: Module.chat.rawValue)
        walletButton = configureButton(logo: "wallet", tag: Module.wallet.rawValue)
        favouriteButton = configureButton(logo: "favourite", tag: Module.favourite.rawValue)
        
        productButton.target = self
        productButton.action =  #selector(buttonClicked(_:))
        orderButton.target = self
        orderButton.action = #selector(buttonClicked(_:))
        chatButton.target = self
        chatButton.action = #selector(buttonClicked(_:))
        walletButton.target = self
        walletButton.action = #selector(buttonClicked(_:))
        favouriteButton.target = self
        favouriteButton.action = #selector(buttonClicked(_:))
        
        stackView = NSStackView(views: [productButton, orderButton, favouriteButton, walletButton, chatButton])
        stackView.orientation = .vertical
        stackView.wantsLayer = true

        stackView.spacing = 40
        
        addSubview(stackView)
        
        themeButton = configureButton(logo: "dark", tag: 7)
        themeButton.target = self
        themeButton.alignment = .center
        themeButton.action = #selector(themeChange(_:))
        themeButton.highlight(false)
        addSubview(themeButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        themeButton.translatesAutoresizingMaskIntoConstraints = false
       
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            themeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            themeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            themeButton.topAnchor.constraint(greaterThanOrEqualTo: stackView.bottomAnchor, constant: 100)
        ])
    }
    
    var darkTheme = false
    
    @objc func themeChange(_ sender: NSButton) {
        if darkTheme == false {
            let lightImage = NSImage(named: "light")
            lightImage?.size = NSSize(width: 20, height: 20)
            sender.image = lightImage?.tint(color: .white)
            darkTheme = true
        }
        
        else {
            let darkImage = NSImage(named: "dark")
            darkImage?.size = NSSize(width: 20, height: 20)
            sender.image = darkImage?.tint(color: .white)
            darkTheme = false
        }
    }
    
    @objc func buttonClicked(_ sender: NSButton) {
        
        for views in stackView.views {
            let button = views as? NSButton
            button?.layer?.backgroundColor = .clear
            button?.image = button?.image?.tint(color: .white)
        }
        sender.layer?.backgroundColor = NSColor.systemOrange.cgColor
        sender.image = sender.image?.tint(color: .black)
        
        switch sender.tag {
        case Module.product.rawValue:
            moduleChangeDelegate?.getproductsView()
        case Module.order.rawValue:
            moduleChangeDelegate?.getOrdersView()
        default:
            return
        }
    }
    
    func configureButton(logo: String, tag: Int) -> NSButton {
       let button = NSButton()
       var image = NSImage(named: logo)
        button.tag = tag
       image?.size = NSSize(width: 20, height: 20)
       image = image?.tint(color: .white)
       button.wantsLayer = true
       button.layer?.cornerRadius = 20
       button.isBordered = false
       button.translatesAutoresizingMaskIntoConstraints = false
       button.image = image
       NSLayoutConstraint.activate([
        button.widthAnchor.constraint(equalToConstant: 40),
           button.heightAnchor.constraint(equalToConstant: 40),
       ])
       return button
    }
}

