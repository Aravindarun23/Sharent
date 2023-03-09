//
//  AddNewProductDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation

public class AddNewProductDataBaseService: AddNewProductDataBaseContract {
   
    public init() {
        
    }
    
    public func addNewProduct(product: Product, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        var detail: String = ""
        let columnName = "catogeryId,sellerId,productName,price,productDetail,uploadedDate,status"
        let status = product.status.rawValue
        
        if let productDetail = product.detail  {
            detail = productDetail
        }

        let insertValue = "'\(product.catogery.id)', '\(product.seller.id)', '\(product.name)', '\(product.price)','\(detail)', '\(product.uploadedDate)', '\(status)'"
        
        InsertQuerry.insertQuerry(tableName: "product", columnName: columnName, insertData: insertValue) {
            response in
            success("Product Added Sucessfully")
        } error: {
            error in
            failure(error)
        }
    }
}
