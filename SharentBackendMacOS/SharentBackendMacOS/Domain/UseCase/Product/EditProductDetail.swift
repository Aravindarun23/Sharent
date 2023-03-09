//
//  EditProductDeatail.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation
import VTComponents


public final class EditProductDetailRequest: ZRequest {
    
    var product: Product
    
    public init(product: Product) {
        self.product = product
        super.init(zuid: "")
    }
}

public final class EditProductDetailResponse: ZResponse {
    
    public var responseMessage: String
    
    init(responseMessage: String) {
        self.responseMessage = responseMessage
    }
    
}

public final class EditProductDetailError: ZError {
    
}

public final class EditProductDetail: ZUsecase<EditProductDetailRequest, EditProductDetailResponse, EditProductDetailError> {
    
    let editProductDetailDataManager : EditProductDetailDataContract
    
    public init(editProductDetailDataManager: EditProductDetailDataContract) {
        self.editProductDetailDataManager = editProductDetailDataManager
    }
    
    override public func run(request: EditProductDetailRequest, success: @escaping (EditProductDetailResponse) -> Void, failure: @escaping (EditProductDetailError) -> Void) {
        editProductDetailDataManager.editProductDetail(product: request.product) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
            
        } failure: { error in
            
        }
    }
        
        private func success(callback: @escaping (EditProductDetailResponse) -> Void, message: String) {
            let response = EditProductDetailResponse(responseMessage: message)
            invokeSuccess(callback: callback, response: response)
        }
        
    
}
