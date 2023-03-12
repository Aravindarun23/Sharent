//
//  DeleteProductDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation


public class DeleteProductDataBaseService: DeleteProductDataBaseContract {
    
    public init() {
        
    }
    
    public func deleteProduct(productId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
    {
        DeleteQuerry.deleteQuerry(tableName: "product", condition: "id = \(productId)") { [weak self]
            response in
            self?.success(callback: success, message: response)
        } error: { [weak self] error in
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
