//
//  AdminLoginDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation

public class AdminLoginDataManager: AdminLoginDataContract {
   
        
    let adminLoginDataBaseService: AdminLoginDataBaseContract
    
    public init(adminLoginDataBaseService: AdminLoginDataBaseContract) {
        self.adminLoginDataBaseService = adminLoginDataBaseService
    }
    
    public func adminLogin(emailId: String, password: String, response: @escaping (Admin) -> Void, failure: @escaping (Error) -> Void) {
        adminLoginDataBaseService.adminLogin(emailId: emailId, password: password) { [weak self]
            admin in
            self?.success(callBack: response, response: admin)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callBack: @escaping (Admin) -> Void, response: Admin) {
        
        callBack(response)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        
        callback(error)
    }
    
}
