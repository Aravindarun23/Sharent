//
//  UserLoginDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 27/02/23.
//

import Foundation

public protocol UserLoginDataContract {
    
    func userLogin(emailId: String, password: String, response: @escaping (User) -> Void, failure: @escaping (Error) -> Void)
}
