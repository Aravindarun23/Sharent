//
//  AddNewProductDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation


public class AddNewProductDataManager: AddNewProductDataContract {
    
    let addNewProductDataBase: AddNewProductDataBaseContract
    
    public init(addNewProductDataBase: AddNewProductDataBaseContract) {
        self.addNewProductDataBase = addNewProductDataBase
    }
    
    
    public func addNewProduct(product: Product, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        addNewProductDataBase.addNewProduct(product: product) { [weak self]
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
