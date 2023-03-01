//
//  UserSignUpDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation

public class AddNewUserDataManager: AddNewUserDataContract  {
    
    let addNewUserDataBase : AddNewUserDataBaseContract
    
    public init(addNewUserDataBase: AddNewUserDataBaseContract) {
        self.addNewUserDataBase = addNewUserDataBase
    }
    
    public func addNewUser(request: User, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        addNewUserDataBase.addNewUser(request: request)
        { [weak self] (response) in
            self?.success(callback: success, responseMessage: response)
            
        } failure: { [weak self] (error) in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (String) -> Void, responseMessage: String) {
        callback(responseMessage)
    }
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
    
}
