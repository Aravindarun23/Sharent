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
        let columnName = "categoryId,sellerId,name,price,detail,uploadedDate,status"
        let status = product.status.rawValue
        
        if let productDetail = product.detail  {
            detail = productDetail
        }
        print(product.category.id)

        let insertValue = "'\(product.category.id)', '\(product.seller.id)', '\(product.name)', '\(product.price)','\(detail)', '\(product.uploadedDate)', '\(status)'"
        
        InsertQuerry.insertQuerry(tableName: "product", columnName: columnName, insertData: insertValue) {
            response in
            success("Product Added Sucessfully")
        } error: {
            error in
            failure(error)
        }
    }
}
