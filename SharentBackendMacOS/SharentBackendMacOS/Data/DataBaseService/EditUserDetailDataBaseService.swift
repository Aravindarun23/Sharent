//
//  EditUserDetailDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation

public class EditUserDetailDataBaseService: EditUserDetailDataBaseContract {
   
    public init() {
        
    }
    
    let tableName = "user"
    
    public func editUserDetail(userId: Int, address: String, pincode: String, mobileNumber: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let updateQuerry = "address = \'\(address)\',pincode = \'\(pincode)\',mobileNumber = \'\(mobileNumber)\'"
        let condition = "userId = \(userId)"

        UpdateQuerry.updateQuerry(tableName: tableName, updateQuerry: updateQuerry,condition: condition) {
            responseMsg in
            success(responseMsg)
        } error: { error  in
            failure(error)
        }
    }
}
