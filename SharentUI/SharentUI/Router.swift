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

    func launchLoginPage() {
        self.window.contentViewController = Authentication(router: self)
    }
    
    func navigateHomePage(user: User, router: Router) {
        self.window.contentViewController = HomeViewController(user: user, router: router)
    }
    
    func addNewUserView() {
        self.window.contentView = Assembler.userSignUpPageViewAssembler(router: self)
    }
    func userLoginView() {
        self.window.contentView = Assembler.userLoginPageViewAssembler(router: self)
    }
    
    func getCatogeryView() {
        self.window.contentView = Assembler.categoryListviewAssembler(router: self)
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
        self.window.contentView = Assembler.addCategoryAssembler(router: self)
    }
    
    func deleteCategoryView() {
        self.window.contentView = Assembler.deleteCategoryAssembler(router: self)
    }
    
    func adminLoginView() {
        self.window.contentView = Assembler.adminLoginAssembler(router: self)
    }
    
    func searchProductView() {
        self.window.contentView = Assembler.searchProductAssembler(router: self)
    }
    
    func placeOrderView() {
        self.window.contentView = Assembler.placeOrderAssembler(router: self)
    }
    
    func getOrderListView() {
        self.window.contentView = Assembler.getOrderListAssembler(router: self)
    }
    
    func cancelOrderView() {
        self.window.contentView = Assembler.cancelOrderAssembler(router: self)
    }
    
    func getProductListView() {
        self.window.contentView = Assembler.getProductListView(router: self)
    }
    
    func editUserDetailView() {
        self.window.contentView = Assembler.editUserDetailView(router: self)
    }
    
    func approveOrderView() {
        self.window.contentView = Assembler.approveOrderView(router: self)
    }
    
    func getProductBookedDateView() {
        self.window.contentView = Assembler.getProductBookedDateView(router: self)
    }
    
    func updatePasswordView() {
        self.window.contentView = Assembler.updatePasswordView(router: self)
    }
    
    func verifyPincodeView() {
        self.window.contentView = Assembler.verifyPincodeView(router: self)
    }
}
