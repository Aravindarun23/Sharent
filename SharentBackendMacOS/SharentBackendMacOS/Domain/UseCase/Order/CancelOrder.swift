//
//  CancelOrder.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 08/03/23.
//

import Foundation
import VTComponents


public final class CancelOrderRequest: ZRequest {
    
    let orderId: Int
    public init(orderId: Int) {
        self.orderId = orderId
        super.init(zuid: "")
    }
}

public final class CancelOrderResponse: ZResponse {
    
    public let responseMessage: String
    init(responseMessage: String) {
        self.responseMessage = responseMessage
    }
    
}

public final class CancelOrderError: ZError {
    
    
}


public final class CancelOrder: ZUsecase<CancelOrderRequest, CancelOrderResponse, CancelOrderError> {
    
    let cancelOrderDataManager: CancelOrderDataContract
    public init(cancelOrderDataManager: CancelOrderDataContract) {
        self.cancelOrderDataManager = cancelOrderDataManager
    }
    
    override public func run(request: CancelOrderRequest, success: @escaping (CancelOrderResponse) -> Void, failure: @escaping (CancelOrderError) -> Void) {
        cancelOrderDataManager.cancelOrder(orderId: request.orderId) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
        } failure: { error in
            
        }
    }
    
    private func success(callback: @escaping(CancelOrderResponse) -> Void, message: String) {
        let response = CancelOrderResponse(responseMessage: message)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping (CancelOrderError) -> Void, error: Error) {
       
    }
}
