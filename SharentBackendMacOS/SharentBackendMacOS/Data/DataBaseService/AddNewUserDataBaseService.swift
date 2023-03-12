//
//  UserSignUpDatBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation
import SQLite3

public class AddNewUserDataBaseService: AddNewUserDataBaseContract {
    
    public init() {
        
    }
    
    public func addNewUser(request: User, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let insertColumnName = "name,emailId,password,mobileNumber,address,pincode"
        let insertValue = "'\(request.name)', '\(request.emailId)', '\(request.password)', '\(request.mobileNumber)', '\(request.address)', '\(request.pincode)'"
        
        InsertQuerry.insertQuerry(tableName: "user", columnName: insertColumnName, insertData: insertValue)
        { [weak self] response in
            self?.success(callback: success, responseMessage: response)
            
        } error: { [weak self] error in
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
