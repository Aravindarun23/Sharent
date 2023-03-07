//
//  GetProductBookingListDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation

public class GetProductBookingListDataManager: GetProductBookingListDataContract {
    
    let getProductBookingListDataBase: GetProductBookingListDataBaseContract
    public init(getProductBookingListDataBase: GetProductBookingListDataBaseContract) {
        self.getProductBookingListDataBase = getProductBookingListDataBase
    }
    
    public func getProductBookingList(userId: Int, success: @escaping ([Order]) -> Void, failure: @escaping (Error) -> Void) {
        getProductBookingListDataBase.getProductBookingList(userId: userId) { [weak self]
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
