//
//  DeleteCategoryDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation

public class DeleteCategoryDataBaseService: DeleteCategoryDataBaseContract {
    
    public init() {
        
    }
    
    public func deleteCategory(categoryId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let tableName = "catogery"
        let condition = "catogeryId = \(categoryId)"
        
        
        DeleteQuerry.deleteQuerry(tableName: tableName, condition: condition) {
            responseMsg in
            self.success(callback: success, message: "Delete Catogery Successfully")
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
