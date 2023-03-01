//
//  UserLoginView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 27/02/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class UserLoginView: NSView {
    
    var presenter: UserLoginPresenterContract
    
    init(presenter: UserLoginPresenterContract) {
        self.presenter = presenter
        super.init(frame: NSRect())
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            userLogin()
        }
    }

}

extension UserLoginView {
    
    func userLogin() {
        presenter.viewDidLoad(email: "arvind123", password: "a123")
    }
}


extension UserLoginView: UserLoginViewContract {
    
    func faiure(error: UserLoginError) {
        print(error.status)
    }
    
    func load(name: String) {
        print("login Sucessfully")
        print("Welcome \(name)")
    }
    
}
