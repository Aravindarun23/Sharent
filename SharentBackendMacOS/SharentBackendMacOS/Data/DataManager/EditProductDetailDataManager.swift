//
//  EditProductDetailDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation

public class EditProductDetailDataManager: EditProductDetailDataContract  {
  
    
    let editProductDetailDataBase: EditProductDetailDataBaseContract
    
    public init(editProductDetailDataBase: EditProductDetailDataBaseContract) {
        self.editProductDetailDataBase = editProductDetailDataBase
    }
    
    public func editProductDetail(product: Product, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        editProductDetailDataBase.editProductDetail(product: product) { [weak self]
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
