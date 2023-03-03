//
//  AdminLoginDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation

public protocol AdminLoginDataContract {
    
    func adminLogin(emailId: String, password: String, response: @escaping (Admin) -> Void, failure: @escaping (Error) -> Void)
    
}
