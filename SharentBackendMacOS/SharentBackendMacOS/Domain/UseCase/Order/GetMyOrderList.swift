//
//  ViewMyOrder.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import VTComponents

public final class GetMyOrderRequset: ZRequest {
    
    let userId: Int
    public init(userId: Int) {
        self.userId = userId
        super.init(zuid: "")
    }
}

public final class GetMyOrderResponse: ZResponse {
    
    public let orders: [Order]
    init(orders: [Order]) {
        self.orders = orders
    }
}

public final class GetMyOrderError: ZError {
    
    public enum orderListError: Error {
        case noOrderFound
    }
    
    public var status: Error
    init(status: Error) {
        self.status = status
        super.init(status: .unknownError)
    }
}

public final class GetMyOrder: ZUsecase<GetMyOrderRequset, GetMyOrderResponse, GetMyOrderError> {
    
    let getMyOrderDataManager: GetMyOrderListDataContract
    public init(getMyOrderDataManager: GetMyOrderListDataContract) {
        self.getMyOrderDataManager = getMyOrderDataManager
    }
    
    override public func run(request: GetMyOrderRequset, success: @escaping (GetMyOrderResponse) -> Void, failure: @escaping (GetMyOrderError) -> Void) {
        getMyOrderDataManager.getMyOrder(userId: request.userId) { [weak self]
            orders in
            self?.success(callback: success, orders: orders)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: (GetMyOrderResponse) -> Void, orders: [Order]) {
        let response = GetMyOrderResponse(orders: orders)
        callback(response)
    }
    
    private func failure(callback: (GetMyOrderError) -> Void, error: Error) {
        let error = GetMyOrderError(status: error)
        callback(error)
    }
            
}
