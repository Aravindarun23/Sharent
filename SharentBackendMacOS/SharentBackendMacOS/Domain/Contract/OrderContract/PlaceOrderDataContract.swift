//
//  PlaceOrderDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation

public protocol PlaceOrderDataContract {
    
    func placeOrder(productId: Int, userId: Int, fromDate: String, toDate: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
