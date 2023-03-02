//
//  DeleteUserDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation


public class DeleteUserDataBaseService: DeleteUserDataBaseContract {
    
    
    public init() {
        
    }
    
    public func deleteUser(userId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let condition = "userId = \(userId)"
        
        DeleteQuerry.deleteQuerry(tableName: "user", condition: condition) { [weak self]
            response in
            self?.succes(callback: success, message: response)
        } error: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func succes(callback: @escaping (String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
    
}
