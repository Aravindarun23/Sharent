//
//  DeleteUserPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import SharentBackendMacOS


class DeleteUserPresenter {
    
    let deleteUser: DeleteUser
    weak var deleteUserView: DeleteUserViewContract?
    weak var router: Router?
    
    init(deleteUser: DeleteUser) {
        
        self.deleteUser = deleteUser
    }
}

extension DeleteUserPresenter: DeleteUserPresenterContract {
    
    func viewDidLoad(userId: Int) {
        let request = DeleteUserRequest(userId: userId)
        deleteUser.execute(request: request) {
            response in
            self.deleteUserView?.load(message: response.responseMsg)
        } onFailure: { error in
            
        }
    }
}
