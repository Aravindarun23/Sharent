//
//  UserLoginPagePresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 27/02/23.
//

import Foundation


import SharentBackendMacOS

class UserLoginPagePresenter {
    
        weak var userLoginPageView: UserLoginViewContract?
        weak var router: Router?
        var userLogin: UserLogin
    
    init(userLoginPageView: UserLoginViewContract? = nil, router: Router? = nil, userLogin: UserLogin) {
        self.userLoginPageView = userLoginPageView
        self.router = router
        self.userLogin = userLogin
    }
}

extension UserLoginPagePresenter: UserLoginPresenterContract {
    func viewDidLoad(email: String, password: String) {
        userLogin.execute(request: UserLoginRequest(emailId: email, password: password)) { [weak self]
            response in
            self?.userLoginPageView?.load(user: response.user)
            self?.router?.navigateHomePage(user: response.user, router: (self?.router!)!)
        } onFailure: { error in
            self.userLoginPageView?.faiure(error: error)
        }
    }
}
