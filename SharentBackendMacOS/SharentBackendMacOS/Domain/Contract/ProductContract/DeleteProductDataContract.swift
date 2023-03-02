//
//  DeleteProductDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation


public protocol DeleteProductDataContract {
    
    func deleteProduct(productId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
