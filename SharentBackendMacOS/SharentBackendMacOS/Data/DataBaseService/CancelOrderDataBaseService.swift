//
//  CancelOrderDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 08/03/23.
//

import Foundation

public class CancelOrderDataBaseService: CancelOrderDataBaseContract {
  
    public init() {
        
    }
    
    public func cancelOrder(orderId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let tableName = "orders"
        let condition = "id = \(orderId)"
        DeleteQuerry.deleteQuerry(tableName: tableName, condition: condition) { [weak self]
            responseMsg in
            self?.success(callback: success, message: "Order Cancelled Successfully")
            
        } error: { error in
            
        }
    }

    private func success(callback: @escaping(String) -> Void, message: String) {
        callback(message)
    }

}
