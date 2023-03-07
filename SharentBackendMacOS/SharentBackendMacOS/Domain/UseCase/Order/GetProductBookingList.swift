//
//  GetProductBookingList.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import VTComponents

public final class GetProductBookingListRequest: ZRequest {
    
    let userId: Int
    public init(userId: Int) {
        self.userId = userId
        super.init(zuid: "")
    }
}

public final class GetProductBookingListResponse: ZResponse {
    
    public let orders: [Order]
    init(orders: [Order]) {
        self.orders = orders
    }
}

public final class GetProductBookingListError: ZError {
    
    public enum bookingListError: Error {
        case noBookingFound
    }
    
    public var status: Error
    init(status: Error) {
        self.status = status
        super.init(status: .unknownError)
    }

}

public final class GetProductBookingList: ZUsecase<GetProductBookingListRequest, GetProductBookingListResponse, GetProductBookingListError> {
    
    let getProductBookingListDataManager: GetProductBookingListDataContract
    public init(getProductBookingListDataManager: GetProductBookingListDataContract) {
        self.getProductBookingListDataManager = getProductBookingListDataManager
    }
    
    override public func run(request: GetProductBookingListRequest, success: @escaping (GetProductBookingListResponse) -> Void, failure: @escaping (GetProductBookingListError) -> Void) {
        getProductBookingListDataManager.getProductBookingList(userId: request.userId) { [weak self]
            orders in
            self?.success(callback: success, orders: orders)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: (GetProductBookingListResponse) -> Void, orders: [Order]) {
        let response = GetProductBookingListResponse(orders: orders)
        callback(response)
    }
    
    private func failure(callback: (GetProductBookingListError) -> Void, error: Error) {
        let error = GetProductBookingListError(status: error)
        callback(error)
    }
            
}
