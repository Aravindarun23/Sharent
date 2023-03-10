//
//  UpdatePasswordDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation

public class UpdatePasswordDataBaseService: UpdatePasswordDataBaseContract {
    
    public init() {
        
    }
    
    let tableName = "user"
    
    
    public func updatePassword(userId: Int, newPassword: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let updateQuerry = "password = \'\(newPassword)\'"
        let whereCondition = "userId = \(userId)"
        
        UpdateQuerry.updateQuerry(tableName: tableName, updateQuerry: updateQuerry , condition: whereCondition) {
            response in
            success(response)
        } error:  {
            error in
            failure(error)
        }
    }
}
