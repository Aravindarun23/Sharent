//
//  GetMyOrderListDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation

public class GetOrderListDataManager: GetOrderListDataContract {
    
    let getOrderListDataBase: GetOrderListDataBaseContract
    let getProductImageFile: GetProductImageFileContract
    
    public init(getOrderListDataBase: GetOrderListDataBaseContract, getProductImageFile: GetProductImageFileContract) {
        self.getOrderListDataBase = getOrderListDataBase
        self.getProductImageFile = getProductImageFile
    }
    
    public func getOrderList(buyerId: Int?, sellerId: Int?, success: @escaping ([Order]) -> Void, failure: @escaping (Error) -> Void) {
        getOrderListDataBase.getOrderList(buyerId: buyerId, sellerId: sellerId) { [weak self]
            orders in
            self?.getProductImage(orders: orders, callback: success)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
            
        }
    }
    private func getProductImage(orders: [Order], callback: @escaping([Order]) -> Void) {
        self.getProductImageFile.getOrderProductImage(orders: orders) { [weak self]
            orders in
            self?.success(callback: callback, orders: orders)
        }
    }
    
    private func success(callback: ([Order]) -> Void, orders: [Order]) {
        callback(orders)
    }
    
    private func failure(callback: (Error) -> Void, error: Error) {
        callback(error)
    }
}
