//
//  UserSignUpViewPresnter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation
import SharentBackendMacOS

class AddNewUserPresenter {
    
        weak var addNewUserView: AddNewUserViewContract?
        weak var router: Router?
        var addNewUser: AddNewUser
        
    init(addNewUser: AddNewUser) {
        self.addNewUser = addNewUser
    }
        
}

extension AddNewUserPresenter: AddNewUserPresenterContract {
    
    func viewLoad(user: User) {
        let request = AddNewUserRequest(user: user)
        addNewUser.execute(request: request) { [weak self]
            response in
            self?.addNewUserView?.load(sucess: response)
            
        } onFailure: { [weak self] error in
            self?.addNewUserView?.failure(error: error)
        }
    }
}
