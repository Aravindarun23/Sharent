//
//  HomeView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/05/23.
//

import Foundation
import AppKit
import Cocoa

class HomePage: NSViewController {
    
    let toolBar = ToolBar()
    let menuBar = LeftMenuBar()
    let bottomBorder = CALayer()
    var contentView: NSView!
    var filterView =  FilterVIew()
    var rightSideBarWidth: NSLayoutConstraint!
    
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
//        configureMenuBar()
//        configureFilterView()
//        configureContentView()
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
        
        contentView = NSView()
        contentView.wantsLayer = true
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: toolBar.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: menuBar.rightAnchor),
            contentView.rightAnchor.constraint(equalTo: filterView.leftAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureFilterView() {
        view.addSubview(filterView)
        filterView.translatesAutoresizingMaskIntoConstraints = false
        rightSideBarWidth =  filterView.widthAnchor.constraint(equalToConstant: 240)
        NSLayoutConstraint.activate([
            rightSideBarWidth,
            filterView.topAnchor.constraint(equalTo: toolBar.bottomAnchor),
            filterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            filterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func toggleSideBar(_ sender: NSButton) {
     
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.4
            context.allowsImplicitAnimation = true
            
            if rightSideBarWidth.constant == 0 {
                rightSideBarWidth.constant = 240
                
            } else {
                rightSideBarWidth.constant = 0
            }
            self.view.layoutSubtreeIfNeeded()
        }, completionHandler: nil)
    }
}

