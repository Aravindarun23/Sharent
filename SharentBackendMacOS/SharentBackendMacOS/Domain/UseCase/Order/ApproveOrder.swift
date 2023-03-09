//
//  ApproveOrder.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation
import VTComponents


public final class ApproveOrderRequest: ZRequest {
    
    var orderId: Int
    public init(orderId: Int) {
        self.orderId = orderId
        super.init(zuid: "")
    }
}

public final class ApproveOrderResponse: ZResponse {
    
    public let responseMessage: String
    init(responseMessage: String) {
        self.responseMessage = responseMessage
    }
}

public final class ApproveOrderError: ZError {
    
}

public final class ApproveOrder: ZUsecase<ApproveOrderRequest,ApproveOrderResponse, ApproveOrderError> {
    
    let approveOrderDataManager: ApproveOrderDataContract
    public init(approveOrderDataManager: ApproveOrderDataManager) {
        self.approveOrderDataManager = approveOrderDataManager
    }
    
    override public func run(request: ApproveOrderRequest, success: @escaping (ApproveOrderResponse) -> Void, failure: @escaping (ApproveOrderError) -> Void) {
        approveOrderDataManager.approveOrder(orderId: request.orderId) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
            
        } failure: { error in
            
        }
    }
    
    private func success(callback: @escaping(ApproveOrderResponse) -> Void, message: String) {
        let response = ApproveOrderResponse(responseMessage: message)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping(ApproveOrderError) -> Void, error: Error) {
        
    }
}


