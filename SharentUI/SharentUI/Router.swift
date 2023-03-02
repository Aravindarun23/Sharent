//
//  Router.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class Router {
    var window: NSWindow
    init(window: NSWindow) {
        self.window = window
    }

    func launch() {
        self.window.contentView = Assembler.signupAssembler(router: self)
    }
    
    func moveSignUpPage() {
        self.window.contentView = Assembler.userSignUpPageViewAssembler(router: self)
    }
    
    func movetoLoginPage() {
        self.window.contentView = Assembler.userLoginPageViewAssembler(router: self)
    }

    func movetoUserHomeView() {
        self.window.contentView = Assembler.userHomeViewAssembler(router: self)
    }
    
    func getCatogeryView() {
        self.window.contentView = Assembler.catogeryListviewAssembler(router: self)
    }
    func addNewProductView() {
        self.window.contentView = Assembler.addNewProductAssembler(router: self)
    }
    
    func editProductDetailView() {
        self.window.contentView = Assembler.editProductDetailAssembler(router: self)
    }
    
    func deleteProductView() {
        self.window.contentView = Assembler.deleteProductAssembler(router: self)
    }
    
    func deleteUserView() {
        self.window.contentView = Assembler.deleteUserAssembler(router: self)
    }
    
    func addCatogeryView() {
        self.window.contentView = Assembler.addCatogeryAssembler(router: self)
    }

}
