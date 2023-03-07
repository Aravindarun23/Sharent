//
//  SearchProductDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 06/03/23.
//

import Foundation

public protocol SearchProductDataContract {
    
    func SearchProduct(pincode: String, product: String, fromDate: String, toDate: String, success: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void)
}