//
//  AdminLoginDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation

public class AdminLoginDataBaseService: AdminLoginDataBaseContract {
    
    public init() {
        
    }
    
    public func adminLogin(emailId: String, password: String, response: @escaping (Admin) -> Void, failure: @escaping (Error) -> Void) {
        let tableName = "admin"
        let whereQuerry = "emailId = ?"
        let args = [emailId]
        
        let result = SelectQuerry.select(tableName: tableName, whereClause: whereQuerry, args: args)
        
        if result?.count != 0 {
            
            if let resultPassword = result![0]["password"] as? String, let id = result![0]["id"] as? Int {
                if resultPassword == password {
                    response(Admin(id: id, emailId: emailId, password: password))
                }
                else {
                    failure(AdminLoginError.AdminError.invalidPassword)
                }
            }
        }
        else {
            failure(AdminLoginError.AdminError.invalidEmailId)
        }
    }
}
