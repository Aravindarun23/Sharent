//
//  EditProductDetailDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation

public protocol EditProductDetailDataContract {
    
    func editProductDetail(product: Product, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
