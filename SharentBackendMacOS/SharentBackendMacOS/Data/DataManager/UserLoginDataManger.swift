//
//  UserLoginDataManger.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 27/02/23.
//

import Foundation

public class UserLoginDataManager: UserLoginDataContract {

    var userLoginDataBase: UserLoginDataBaseContract
    
    public init(userLoginDataBase: UserLoginDataBaseContract) {
        self.userLoginDataBase = userLoginDataBase
    }
    
    public func userLogin(emailId: String, password: String, response: @escaping (User) -> Void, failure: @escaping (Error) -> Void) {
        
        userLoginDataBase.userLogin(emailId: emailId, password: password) { [weak self]
            user in
            self?.success(callBack: response, response: user)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callBack: @escaping (User) -> Void, response: User) {
        
        callBack(response)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }

    
}
