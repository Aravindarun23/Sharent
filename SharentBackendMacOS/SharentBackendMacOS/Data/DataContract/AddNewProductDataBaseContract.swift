//
//  AddNewProductDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation

public protocol AddNewProductDataBaseContract {
    
    func addNewProduct(product: Product, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
