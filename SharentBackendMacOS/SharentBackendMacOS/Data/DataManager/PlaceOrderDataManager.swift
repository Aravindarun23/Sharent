//
//  PlaceOrderDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation

public class PlaceOrderDataManager: PlaceOrderDataContract {
    
    let placeOrderDataBase: PlaceOrderDataBaseContract
    
    public init(placeOrderDataBase: PlaceOrderDataBaseContract) {
        self.placeOrderDataBase = placeOrderDataBase
    }
    
    public func placeOrder(productId: Int, userId: Int, fromDate: String, toDate: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        placeOrderDataBase.placeOrder(productId: productId, userId: userId , fromDate: fromDate, toDate: toDate) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
        } failure: { [weak self] error in
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
