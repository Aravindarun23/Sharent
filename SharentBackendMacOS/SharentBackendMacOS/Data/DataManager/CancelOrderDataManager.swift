//
//  CancelOrderDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 08/03/23.
//

import Foundation


public class CancelOrderDataManager: CancelOrderDataContract  {
    
    let cancelOrderDataBase: CancelOrderDataBaseContract
    public init(cancelOrderDataBase: CancelOrderDataBaseContract) {
        self.cancelOrderDataBase = cancelOrderDataBase
    }
    
    public func cancelOrder(orderId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        cancelOrderDataBase.cancelOrder(orderId: orderId) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping(String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
}
