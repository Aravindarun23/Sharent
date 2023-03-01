//
//  AddNewUserDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation

public protocol AddNewProductDataContract {
    
    func addNewProduct(product: Product, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
