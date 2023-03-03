//
//  AddCatogeryDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation

public class AddCatogeryDataBaseService: AddCatogeryDataBaseContract {
    
    public init() {
        
    }
    
    public func addCatogery(catogeryName: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let tableName = "catogery"
        let columnName = "catogeryName"
        InsertQuerry.insertQuerry(tableName: tableName, columnName: "\'\(columnName)\'", insertData: "\'\(catogeryName)\'") { [weak self]
            responseMsg in
            self?.success(callback: success, message: "Add Catogery Successfully")
        } error: { error in
            self.failure(callback: failure, error: error)
            
        }
    }
    
    private func success(callback: @escaping (String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
    
    
    
    
}
