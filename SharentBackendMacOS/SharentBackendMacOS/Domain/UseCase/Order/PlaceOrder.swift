//
//  PlaceOrder.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import VTComponents


public final class PlaceOrderRequest: ZRequest {
    var productId: Int
    var buyerId: Int
    var fromDate: String
    var toDate: String
    
    public init(productId: Int, buyerId: Int, fromDate: String, toDate: String) {
        self.productId = productId
        self.buyerId = buyerId
        self.fromDate = fromDate
        self.toDate = toDate
        super.init(zuid: "")
    }
    
}

public final class PlaceOrderResponse: ZResponse {
    
    public let responseMessage: String
    
    init(responseMessage: String) {
        self.responseMessage = responseMessage
    }
    
}

public final class PlaceOrderError: ZError {
    
}


public final class PlaceOrder: ZUsecase<PlaceOrderRequest, PlaceOrderResponse, PlaceOrderError> {
    
    let placeOrderDataManager: PlaceOrderDataContract
    
    public init(placeOrderDataManager: PlaceOrderDataContract) {
        self.placeOrderDataManager = placeOrderDataManager
    }
    
    override public func run(request: PlaceOrderRequest, success: @escaping (PlaceOrderResponse) -> Void, failure: @escaping (PlaceOrderError) -> Void) {
        
        placeOrderDataManager.placeOrder(productId: request.productId, userId: request.buyerId, fromDate: request.fromDate, toDate: request.toDate) { responseMsg in
            self.success(callback: success, message: responseMsg)
            
        } failure: { error in
            self.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (PlaceOrderResponse) -> Void, message: String) {
        let response = PlaceOrderResponse(responseMessage: message)
        invokeSuccess(callback: callback, response: response)

    }
    
    private func failure(callback: @escaping (PlaceOrderError) -> Void, error: Error) {
        
    }
}
