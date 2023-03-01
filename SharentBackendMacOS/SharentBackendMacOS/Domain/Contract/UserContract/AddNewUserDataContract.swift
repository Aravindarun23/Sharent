//
//  UserSignUpDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation

public protocol AddNewUserDataContract {
    
    func addNewUser(request: User, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
