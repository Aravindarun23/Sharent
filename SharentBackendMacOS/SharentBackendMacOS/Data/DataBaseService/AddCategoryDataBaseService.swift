//
//  AddCatogeryDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation

public class AddCategoryDataBaseService: AddCategoryDataBaseContract {
    
    public init() {
        
    }
    
    public func addCategory(categoryName: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let tableName = "category"
        let columnName = "name"
        InsertQuerry.insertQuerry(tableName: tableName, columnName: "\'\(columnName)\'", insertData: "\'\(categoryName)\'") { [weak self]
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
