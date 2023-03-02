//
//  DeleteProduct.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import VTComponents



public final class DeleteProductRequest: ZRequest {
    
    var productId: Int
    public init(productId: Int) {
        self.productId = productId
        super.init(zuid: "")
    }
    
}

public final class DeleteProductResponse: ZResponse {
    
    public var responseMessage: String
    init(responseMessage: String) {
        self.responseMessage = responseMessage
    }
    
}

public final class DeleteProductError: ZError {
    
}


public final class DeleteProduct: ZUsecase<DeleteProductRequest, DeleteProductResponse, DeleteProductError> {
    
    let deleteProductDataManager: DeleteProductDataContract
    
    public init(deleteProductDataManager: DeleteProductDataContract) {
        self.deleteProductDataManager = deleteProductDataManager
    }
    
    override public func run(request: DeleteProductRequest, success: @escaping (DeleteProductResponse) -> Void, failure: @escaping (DeleteProductError) -> Void) {
        deleteProductDataManager.deleteProduct(productId: request.productId) { [weak self]
        responseMsg in
            self?.success(callback: success, message: responseMsg)
            
        } failure: { error in
            
        }
    }
    
    private func success(callback: @escaping (DeleteProductResponse) -> Void, message: String) {
        let response = DeleteProductResponse(responseMessage: message)
        callback(response)
    }
    
    private func failure(callback: @escaping(DeleteProductError) -> Void, error: Error) {
        
    }
    
}
