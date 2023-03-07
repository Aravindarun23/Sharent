//
//  GetMyOrderListDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation

public class GetMyOrderListDataManager: GetMyOrderListDataContract {
    
    let getMyOrderListDataBase: GetMyOrderListDataBaseContract
    
    public init(getMyOrderListDataBase: GetMyOrderListDataBaseContract) {
        self.getMyOrderListDataBase = getMyOrderListDataBase
    }
    
    public func getMyOrder(userId: Int, success: @escaping ([Order]) -> Void, failure: @escaping (Error) -> Void) {
        getMyOrderListDataBase.getMyOrderList(userId: userId) { [weak self]
            orders in
            self?.success(callback: success, orders: orders)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
            
        }
    }
    
    private func success(callback: ([Order]) -> Void, orders: [Order]) {
        callback(orders)
    }
    
    private func failure(callback: (Error) -> Void, error: Error) {
        callback(error)
    }
}
