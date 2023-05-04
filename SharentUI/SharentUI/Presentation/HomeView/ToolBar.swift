//
//  ToolBar.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/05/23.
//

import Foundation
import AppKit

class ToolBar: NSView {
    
    var leftAnchorConstraint: NSLayoutConstraint!
    var toogleButtonStack: NSStackView!
    var sellButton: NSButton!
    var buyButton: NSButton!
    var searchField: NSSearchField!
    var profileButton: NSButton!
    var rightSidebar: NSButton!
    var profilePopOver: NSPopover!
    
    override var acceptsFirstResponder: Bool {
        return true
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        updateToolbar()
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateToolbar() {
        
        sellButton = configureButton(name: "Sell")
        buyButton = configureButton(name: "Buy")
        buyButton.target = self
        sellButton.target = self
        sellButton.action = #selector(buttonClicked(_:))
        buyButton.action = #selector(buttonClicked(_:))
        sellButton.layer?.backgroundColor = .clear
        sellButton.contentTintColor = .white
        
        toogleButtonStack = NSStackView(views: [buyButton, sellButton])
        toogleButtonStack.orientation = .horizontal
        toogleButtonStack.wantsLayer = true
        toogleButtonStack.layer?.backgroundColor = .init(gray: 0.5, alpha: 0.1)
        toogleButtonStack.layer?.cornerRadius = 5
        toogleButtonStack.spacing = 0
        addSubview(toogleButtonStack)
        
        searchField = configureSearchField()
        addSubview(searchField)
        
        profileButton = configureProfileButton()
        addSubview(profileButton)
        
        rightSidebar = configureSideBarButton()
        addSubview(rightSidebar)
        configurePopOver()
        
        toogleButtonStack.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        searchField.translatesAutoresizingMaskIntoConstraints = false
        sellButton.translatesAutoresizingMaskIntoConstraints = false
        
        leftAnchorConstraint = toogleButtonStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            
            toogleButtonStack.widthAnchor.constraint(equalToConstant: 200),
            toogleButtonStack.heightAnchor.constraint(equalToConstant: 33),
            sellButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            leftAnchorConstraint,
            buyButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            searchField.leftAnchor.constraint(greaterThanOrEqualTo: sellButton.rightAnchor, constant: 150),
            searchField.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            profileButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            rightSidebar.trailingAnchor.constraint(equalTo: profileButton.leadingAnchor, constant: -15),
            rightSidebar.topAnchor.constraint(equalTo: topAnchor, constant: 10)
            
        ])
    }
    
    @objc func buttonClicked(_ sender: NSButton) {
        for case let button as NSButton in toogleButtonStack.arrangedSubviews {
            button.layer?.backgroundColor = .clear
            button.contentTintColor = .white
        }
        sender.layer?.backgroundColor = NSColor.systemOrange.cgColor
        sender.contentTintColor = .black
    }
    
    func configureSearchField() -> NSSearchField {
        let searchField = NSSearchField()
        searchField.cell?.controlSize = .large
        searchField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchField.widthAnchor.constraint(equalToConstant: 360),
            searchField.heightAnchor.constraint(equalToConstant: 33)
        ])
        return searchField
    }
    
    
    func configureSideBarButton() -> NSButton {
        let button = NSButton()
        button.isBordered = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image = NSImage(systemSymbolName: "sidebar.squares.right", accessibilityDescription: nil)
        button.symbolConfiguration = NSImage.SymbolConfiguration(pointSize: 13, weight: .regular, scale: .large)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 35),
            button.heightAnchor.constraint(equalToConstant: 33)
        ])
        return button
    }
    
    func configureProfileButton() -> NSButton {
        let button = NSButton()
        button.wantsLayer = true
        button.isBordered = false
        button.target = self
        button.action = #selector(profileButtonClicked(_:))
        button.image = NSImage(named: "profile")
        button.imageScaling = .scaleAxesIndependently
        button.layer?.cornerRadius = 16.5
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 33),
            button.widthAnchor.constraint(equalToConstant: 33)
        ])
        
        return button
    }
    
    func configureButton(name: String) -> NSButton {
        let button = NSButton()
        button.title = name
        button.wantsLayer = true
        button.isBordered = false
        button.alignment = .center
        button.controlSize = .large
        button.contentTintColor = .black
        button.font = .systemFont(ofSize: 13)
        button.layer?.backgroundColor = NSColor.systemOrange.cgColor
        button.layer?.cornerRadius = 7
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 33),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
        return button
    }
    
    func configurePopOver() {
        
        profilePopOver = NSPopover()
        profilePopOver?.behavior = .transient
        profilePopOver?.contentSize = NSSize(width: 200, height: 200)
        profilePopOver?.contentViewController = PopoverContentViewController()
    
    }
    
    
    @objc func profileButtonClicked(_ sender: NSButton) {
        print("buttonClicked()")
        if profilePopOver.isShown {
            profilePopOver.close()
        } else {
            profilePopOver.show(relativeTo: sender.bounds, of: sender, preferredEdge: .maxY)
        }
    }
    
}


class PopoverContentViewController: NSViewController {

    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))
       
        view.wantsLayer = true
        view.layer?.backgroundColor = .init(red: 0.2, green: 0.2, blue: 1, alpha: 0.2)
        let logoutButton =  NSButton()
        logoutButton.title = "Logout"
        logoutButton.wantsLayer = true
        logoutButton.isBordered = false
        logoutButton.alignment = .center
        logoutButton.controlSize = .large
        logoutButton.contentTintColor = .black
        logoutButton.font = .systemFont(ofSize: 15)
        logoutButton.layer?.backgroundColor = NSColor.systemOrange.cgColor
        logoutButton.layer?.cornerRadius = 7
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.heightAnchor.constraint(equalToConstant: 33),
            logoutButton.widthAnchor.constraint(equalToConstant: 100),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

