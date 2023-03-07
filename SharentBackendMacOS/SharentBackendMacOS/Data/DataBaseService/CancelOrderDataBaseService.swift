//
//  CancelOrderDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 08/03/23.
//

import Foundation

public class CancelOrderDataBaseService {
  
    public init() {
        
    }
    
    public static func cancelOrder(orderId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let tableName = "orders"
        let condition = "id = \(orderId)"
        DeleteQuerry.deleteQuerry(tableName: tableName, condition: condition) {
            responseMsg in
            success(responseMsg)
            
        } error: { erroe in
            
        }
    }
}
