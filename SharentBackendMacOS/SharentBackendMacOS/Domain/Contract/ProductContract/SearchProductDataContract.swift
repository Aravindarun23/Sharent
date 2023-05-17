//
//  SearchProductDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 06/03/23.
//

import Foundation

public protocol SearchProductDataContract {
    
    func searchProduct(pincode: String, product: String, filter: SearchProductRequest.Filter?, range: Int?, success: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void)
}
