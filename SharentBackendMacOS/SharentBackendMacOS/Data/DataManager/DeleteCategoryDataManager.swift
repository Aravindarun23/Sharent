//
//  DeleteCatogeryDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation

public class DeleteCategoryDataManager: DeleteCategoryDataContract {
    
    let deleteCategoryDataBase: DeleteCategoryDataBaseContract
    
    public init(deleteCategoryDataBase: DeleteCategoryDataBaseContract) {
        self.deleteCategoryDataBase = deleteCategoryDataBase
    }
    
    public func deleteCategory(categoryId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        deleteCategoryDataBase.deleteCategory(categoryId: categoryId) {
            responseMsg in
            self.success(callback: success, message: responseMsg)
            
        } failure: { error in
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
