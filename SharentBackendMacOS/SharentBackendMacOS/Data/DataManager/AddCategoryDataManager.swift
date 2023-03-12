//
//  AddCatogeryDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation


public class AddCategoryDataManager: AddCategoryDataContract {
    
    
    let addCategoryDataBase: AddCategoryDataBaseContract
    
    public init(addCategoryDataBase: AddCategoryDataBaseContract) {
        self.addCategoryDataBase = addCategoryDataBase
    }
    
    
    public func addCategory(categoryName: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        addCategoryDataBase.addCategory(categoryName: categoryName) { [weak self]
        responseMsg in
            self?.success(callback: success, message: responseMsg)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
    
}
