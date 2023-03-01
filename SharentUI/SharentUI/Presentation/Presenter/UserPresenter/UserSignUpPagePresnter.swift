//
//  UserSignUpViewPresnter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation
import SharentBackendMacOS

class UserSignUpPagePresenter {
    
        weak var userSignUpPageview: UserSignUpPageViewContract?
        weak var router: Router?
        var addNewUser: AddNewUser
        
    init(addNewUser: AddNewUser) {
        self.addNewUser = addNewUser
    }
        
}

extension UserSignUpPagePresenter: UserSignUpPagePresenterContract {
    
    func viewLoad(user: User) {
        let request = AddNewUserRequest(user: user)
        addNewUser.execute(request: request) { [weak self]
            response in
            self?.userSignUpPageview?.load(sucess: response)
            self?.router?.launch()
            
        } onFailure: { [weak self] error in
            self?.userSignUpPageview?.failure(error: error)
        }
    }
}
