//
//  PlaceOrderDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation

public class PlaceOrderDataBaseService: PlaceOrderDataBaseContract {
    
    public init() {
        
    }
 
    public  func placeOrder(productId: Int, userId: Int, fromDate: String, toDate: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let tableName = "orders"
        let columnName = "productId,buyerId,orderDate,pickUpDate,returnDate,totalPrice,status"
        let insertValue = "\(productId),\(userId),'2023-01-23','\(fromDate)','\(toDate)',\(2000),'booked'"
        
        InsertQuerry.insertQuerry(tableName: tableName, columnName: columnName, insertData: insertValue ) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
        } error:  { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }

}
