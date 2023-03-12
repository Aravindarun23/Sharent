//
//  EditProductDetailDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation


public class EditProductDetailDataBaserService: EditProductDetailDataBaseContract {
    
    public init() {
        
    }
    
    public  func editProductDetail(product: Product, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let updateQuerry = "categoryId = \(product.category.id),name = '\(product.name)', price = \(product.price), detail = '\(product.detail ?? "worked" )', uploadedDate = '\(product.uploadedDate)', status = \'\(product.status.rawValue)\'"
        let condition = "id = \(product.id)"
        
        UpdateQuerry.updateQuerry(tableName: "product", updateQuerry: updateQuerry, condition: condition) { [weak self]
            responseMsg in
            self?.success(callback: success, message: "Updated Sucessfully ")
            
        } error: { error in
            
        }
    }
    
    private func success(callback: @escaping (String) -> Void, message: String) {
        
        callback(message)
    }
    
    
    
}
