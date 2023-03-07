//
//  DeleteOrderDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 08/03/23.
//

import Foundation

public protocol CancelOrderDataBaseContract {
    
    func cancelOrder(orderId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void )
}
