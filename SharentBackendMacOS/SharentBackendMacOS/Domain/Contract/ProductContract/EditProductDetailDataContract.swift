//
//  EditProductDetailDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation

public protocol EditProductDetailDataContract {
    
    func editProductDetail(productId: Product, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
