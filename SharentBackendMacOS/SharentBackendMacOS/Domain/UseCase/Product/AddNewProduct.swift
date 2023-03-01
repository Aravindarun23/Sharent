//
//  AddNewProduct.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import VTComponents

public final class AddNewProductRequest: ZRequest {
    
    let product: Product
    
    public init(product: Product) {
        self.product = product
        super.init(zuid: "")
    }
}


public final class AddNewProductResponse: ZResponse {
    
    public let responseMsg: String
    
    public init(message: String) {
        responseMsg = message
    }
    
}

public final class AddNewProductError: ZError {
    
    let error: Error
    
    init(error: Error) {
        self.error = error
        super.init(status: .unknownError)
    }
    
}


public final class AddNewProduct: ZUsecase<AddNewProductRequest, AddNewProductResponse, AddNewProductError> {
    
    let addNewProductDataManager: AddNewProductDataContract
    
    public init(addNewProductDataManager: AddNewProductDataContract) {
        self.addNewProductDataManager = addNewProductDataManager
    }
    
    override public func run(request: AddNewProductRequest, success: @escaping (AddNewProductResponse) -> Void, failure: @escaping (AddNewProductError) -> Void) {
        addNewProductDataManager.addNewProduct(product: request.product) { [weak self]
            (responseMsg) in
            self?.sucess(callback: success, message: responseMsg)
            
        } failure: { [weak self] (error) in
            self?.failure(callback: failure, error: error)
            
        }
    }
    
    private func sucess(callback: @escaping (AddNewProductResponse) -> Void, message: String) {
        let response = AddNewProductResponse(message: message)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping (AddNewProductError) -> Void, error: Error) {
        let failure = AddNewProductError(error: error)
        invokeFailure(callback: callback, failure: failure)
    }
    
}
