//
//  UserLoginDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 27/02/23.
//

import Foundation

public class UserLoginDataBaseService: UserLoginDataBaseContract {
    
    
    public init() {
        
    }
    
    
    public func userLogin(emailId: String, password: String, response: @escaping (User) -> Void, failure: @escaping (Error) -> Void) {
        
        let result = SelectQuerry.select(tableName: "user", whereClause: "emailId = ?", args: [emailId])
        
        if result != nil {
            
            if let resultPassword = result![0]["password"] as? String {
                if resultPassword == password {
                    guard let name = result![0]["name"] as? String,
                          let userId = result![0]["id"] as? Int,
                          let mobileNumber = result![0]["mobileNumber"] as? String,
                          let address = result![0]["address"] as? String,
                          let pincode = result![0]["pincode"] as? String else { return }
                    success(callBack: response, response:User(id: userId, name: name, emailId: emailId, password: password, mobileNumber: mobileNumber, address: address, pincode: pincode) )
                }
                
                else {
                    self.failure(callback: failure, error: UserLoginError.LoginError.invalidPassword)
                }
            }
        }
        else {
            self.failure(callback: failure, error: UserLoginError.LoginError.invalidEmailId)
        }
    }
    
    private func success(callBack: @escaping (User) -> Void, response: User) {
        
        callBack(response)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        
        callback(error)
    }
}
