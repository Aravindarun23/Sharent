//
//  UpdatePasswordPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation
import SharentBackendMacOS

class UpdatePasswordPresenter {
    
    let updatePassword: UpdatePassword
    weak var updatePasswordView: UpdatePasswordViewContract?
    weak var router: Router?
    
    public init(updatePassword: UpdatePassword, updatePasswordView: UpdatePasswordViewContract? = nil, router: Router? = nil) {
        self.updatePassword = updatePassword
        self.updatePasswordView = updatePasswordView
        self.router = router
    }
}

extension UpdatePasswordPresenter: UpdatePasswordPresenterContract {
    
    func viewDidLoad(userId: Int, newPassword: String) {
        let request = UpdatePasswordRequest(userId: userId, newPassword: newPassword)
        updatePassword.execute(request: request) {
            response in
            self.updatePasswordView?.load(message: response.responseMsg)
        } onFailure: { error in
            
        }
    }
}
