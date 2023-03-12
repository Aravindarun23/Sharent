//
//  AdminLoginView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 05/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class AdminLoginView: NSView {
    
    let adminLoginPresenter: AdminLoginPresenterContract
    init(adminLoginPresenter: AdminLoginPresenterContract) {
        self.adminLoginPresenter = adminLoginPresenter
        super.init(frame: NSRect())
    }
    
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            adminLoginPresenter.viewDidLoad(emailId: "admin123", password: "a123")
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AdminLoginView: AdminLoginViewContract {
    
    func failure(error: Error) {
        print(error)
    }
    
    func load(admin: Admin) {
        print(admin.emailId)
    }
    
    
}
