//
//  DeleteProductDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation

public class DeleteProductDataManager: DeleteProductDataContract {
    
    let deleteProductDataBase: DeleteProductDataBaseContract
    
    public init(deleteProductDataBase: DeleteProductDataBaseContract) {
        self.deleteProductDataBase = deleteProductDataBase
    }
    
    
    public func deleteProduct(productId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        deleteProductDataBase.deleteProduct(productId: productId) { [weak self]
        responseMsg in
            self?.success(callback: success, message: responseMsg)
            
        } failure: {  [weak self] error in
            self?.failure(callback: failure, error: error)
            
        }
    }
    
    private func success(callback: @escaping (String) -> Void, message: String) {
        callback(message)
        
    }
    
    private func failure(callback: @escaping(Error) -> Void, error: Error) {
        callback(error)
        
    }
    
    
   
    
    

}
