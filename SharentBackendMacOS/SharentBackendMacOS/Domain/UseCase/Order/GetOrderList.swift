//
//  ViewMyOrder.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import VTComponents

public final class GetOrderListRequest: ZRequest {
    
    let buyerId: Int?
    let sellerId: Int?
    
    public init(buyerId: Int? = nil, sellerId: Int? = nil) {
        self.buyerId = buyerId
        self.sellerId = sellerId
        super.init(zuid: "")
    }
}

public final class GetOrderListResponse: ZResponse {
    
    public let orders: [Order]
    init(orders: [Order]) {
        self.orders = orders
    }
}

public final class GetOrderListError: ZError {
    
    public enum orderListError: Error {
        case noOrderFound
    }
    
    public var status: Error
    init(status: Error) {
        self.status = status
        super.init(status: .unknownError)
    }
}

public final class GetOrderList: ZUsecase<GetOrderListRequest, GetOrderListResponse, GetOrderListError> {
    
    let getOrderListDataManager: GetOrderListDataContract
    public init(getOrderListDataManager: GetOrderListDataContract) {
        self.getOrderListDataManager = getOrderListDataManager
    }
    
    override public func run(request: GetOrderListRequest, success: @escaping (GetOrderListResponse) -> Void, failure: @escaping (GetOrderListError) -> Void) {
        getOrderListDataManager.getOrderList(buyerId: request.buyerId, sellerId: request.sellerId) { [weak self]
            orders in
            self?.success(callback: success, orders: orders)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (GetOrderListResponse) -> Void, orders: [Order]) {
        let response = GetOrderListResponse(orders: orders)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping (GetOrderListError) -> Void, error: Error) {
        let error = GetOrderListError(status: error)
        invokeFailure(callback: callback, failure: error)
    }
            
}
