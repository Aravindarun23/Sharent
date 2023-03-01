//
//  UserSignUpPageView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class UserSignUpPageView: NSView {
    
        var presenter: UserSignUpPagePresenterContract
        var user: User?
        
        init(presenter: UserSignUpPagePresenter) {
            self.presenter = presenter
            super.init(frame: NSZeroRect)
        }
        
        required init?(coder decoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidMoveToSuperview() {
            if superview != nil {
                userSignUp()
            }
        }
}

extension UserSignUpPageView {
    
    func userSignUp() {
        user = User(id: 0, name: "arun", emailId: "arvind123", password: "a123", mobileNumber: "1234567890", address: "coimbatore", pincode: "123456")
        presenter.viewLoad(user: user!)
    }
}

extension UserSignUpPageView: UserSignUpPageViewContract {
    
    
    func load(sucess: AddNewUserResponse) {
        print(sucess.responseMessage)
    }
    
    func failure(error: AddNewUserError) {
        print(error.error)
    }
}
