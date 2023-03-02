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
        
        let updateQuerry = "catogeryId = \(product.catogery.id), sellerId = \(product.seller.id), productName = '\(product.name)', price = \(product.price), productDetail = '\(product.detail ?? "worked" )', uploadedDate = '\(product.uploadedDate)', status = '\("inactive")'"
        let condition = "productId = \(product.id)"
        
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
