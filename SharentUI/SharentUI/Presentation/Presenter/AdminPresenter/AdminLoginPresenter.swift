//
//  AdminLoginPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 05/03/23.
//

import Foundation
import SharentBackendMacOS

class AdminLoginPresenter {
    
    let adminLogin: AdminLogin
    weak var adminLoginView: AdminLoginViewContract?
    weak var roter: Router?
    
    init(adminLogin: AdminLogin) {
        self.adminLogin = adminLogin
    }
}

extension AdminLoginPresenter: AdminLoginPresenterContract {
    
    func viewDidLoad(emailId: String, password: String) {
        let request = AdminLoginRequest(emailId: emailId, password: password)
        adminLogin.execute(request: request) { response in
            self.adminLoginView?.load(admin: response.admin)
        } onFailure: { error in
            self.adminLoginView?.failure(error: error.status)
        }
    }
}
