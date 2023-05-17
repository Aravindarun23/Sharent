//
//  HomeViewController.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/05/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class HomeViewController: NSViewController {
    
    let toolBar = ToolBar()
//    var router: Router
//    var user: User
    let menuBar = LeftMenuBar()
    let bottomBorder = CALayer()
    var currentView = NSView()
    var contentView: NSView
    var currentModule: Module
    var productView: ProductListView
    var orderView: OrderListView
    
    init(user: User, router: Router) {
//        self.user = user
//        self.router = router
        contentView = NSView()
        productView = Assembler.getProductListAssembler(router: router, user: user)
        orderView = Assembler.getOrderListAssembler(router: router, user: user)
        currentModule = .Product
        super.init(nibName: nil, bundle: nil)
        toolBar.searchField.delegate = self
        menuBar.moduleChangeDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        view = NSView(frame: NSRect(x: 0, y: 0, width: (NSScreen.main?.frame.width)!, height: (NSScreen.main?.frame.height)!-110))
        view.wantsLayer = true
    }
    
    override func viewWillLayout() {
        
        view.window!.standardWindowButton(.closeButton)?.frame.origin.x = 8.0
        view.window!.standardWindowButton(.closeButton)?.frame.origin.y = -2.0
        view.window!.standardWindowButton(.miniaturizeButton)?.frame.origin.x = 30.0
        view.window!.standardWindowButton(.miniaturizeButton)?.frame.origin.y = -2.0
        view.window!.standardWindowButton(.zoomButton)?.frame.origin.x = 52.0
        view.window!.standardWindowButton(.zoomButton)?.frame.origin.y = -2.0
        
        if isFullScreen {
            toolBar.leftAnchorConstraint.constant = 15
        }
        else {
            toolBar.leftAnchorConstraint.constant = 84
        }
        bottomBorder.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 0.1)
    }
    
    override func viewDidLoad() {
        congigureToolBar()
        configureMenuBar()
        configureContentView()
        getproductsView()
    }
    
    func congigureToolBar() {
        
        toolBar.wantsLayer = true
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.rightSidebar.target = self
        toolBar.rightSidebar.action = #selector(toggleSideBar(_:))
        view.addSubview(toolBar)
        NSLayoutConstraint.activate([
            toolBar.heightAnchor.constraint(equalToConstant: 55),
            toolBar.topAnchor.constraint(equalTo: view.topAnchor),
            toolBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        bottomBorder.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 0.1)
        bottomBorder.backgroundColor = NSColor.white.cgColor
        
        toolBar.layer?.addSublayer(bottomBorder)
    }
    
    func configureMenuBar() {
        menuBar.wantsLayer = true
        menuBar.layer?.cornerRadius = 20
        menuBar.layer?.backgroundColor = .init(red: 0.2, green: 0.2, blue: 1, alpha: 0.15)
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuBar.topAnchor.constraint(equalTo: toolBar.bottomAnchor, constant: 20),
            menuBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            menuBar.widthAnchor.constraint(equalToConstant: 55),
            menuBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        ])
    }
    
    func configureContentView() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: menuBar.topAnchor),
            contentView.leftAnchor.constraint(equalTo: menuBar.rightAnchor),
            contentView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: menuBar.bottomAnchor)
        ])
    }
    
    func getproductsView() {
        toolBar.rightSidebar.isHidden = false
        currentView.removeFromSuperview()
        productView.wantsLayer = true
        contentView.addSubview(productView)
        productView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        currentModule = .Product
        currentView = productView
    }
    
    func getOrdersView() {
        currentView.removeFromSuperview()
        toolBar.rightSidebar.isHidden = true
        contentView.addSubview(orderView)
        orderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderView.topAnchor.constraint(equalTo: menuBar.topAnchor),
            orderView.leadingAnchor.constraint(equalTo: menuBar.trailingAnchor, constant: 20),
            orderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orderView.bottomAnchor.constraint(equalTo: menuBar.bottomAnchor),
        ])
        currentModule = .Order
        currentView = orderView
    }
    
    @objc func toggleSideBar(_ sender: NSButton) {
       
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.4
            context.allowsImplicitAnimation = true
            
            if productView.rightFilterViewWidth.constant == 0 {
                productView.rightFilterViewWidth.constant = 240
                
            } else {
                productView.rightFilterViewWidth.constant = 0
            }
            self.view.layoutSubtreeIfNeeded()
        }, completionHandler: nil)
    }
}

extension HomeViewController: NSSearchFieldDelegate {
    
   func controlTextDidEndEditing(_ obj: Notification) {
       if currentModule == .Product {
           productView.searchProductPresenter.viewDidLoad(productName: toolBar.searchField.stringValue, pincode: "614602", filter: nil, range: nil)
           productView.lastSearch = toolBar.searchField.stringValue
       }
       else if currentModule == .Order  {
           orderView.searchOrder(name: toolBar.searchField.stringValue)
       }
   }
}

extension HomeViewController {
    
    enum Module {
        case Product
        case Order
        case Wishlist
        case Wallet
    }
}
