//
//  UserSignUpDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation


public protocol AddNewUserDataBaseContract {
    
    func addNewUser(request: User, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
    
}


