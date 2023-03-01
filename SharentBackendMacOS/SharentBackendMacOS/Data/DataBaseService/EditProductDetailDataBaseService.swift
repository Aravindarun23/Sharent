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
    
    public func editProductDetail(product: Product, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let UpdateQuerry = "productName = '\(product.name)', catogeryId = '\(product.catogery.id)', '\(product.seller.id)', '\(product.name)', '\(product.price)','\(detail)', '\(product.uploadedDate)', '\(currentStatus)'"
        
        UpdateQuerry.insertQuerry(tableName: "product", updateQuerry:, condition: <#T##String#>, response: <#T##(String) -> Void#>, error: <#T##(Error) -> Void#>)
        
    }
    
    
}
