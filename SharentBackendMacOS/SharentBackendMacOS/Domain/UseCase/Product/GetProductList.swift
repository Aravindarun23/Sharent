//
//  ViewProductList.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation
import VTComponents


public final class GetProductListRequest: ZRequest {
    
    public var userId: Int
    public init(userId: Int) {
        self.userId = userId
        super.init(zuid: "")
    }
    
}

public final class GetProductListResponse: ZResponse {
    
    public let products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
    
    
}

public final class GetProductListError: ZError {
    
    enum GetProductListError: Error {
        case noProductFound
    }
    
    public var status : Error
    
    public init(error: Error) {
        status = error
        super.init(status: .unknownError)
    }
    
}

public class GetProductList: ZUsecase<GetProductListRequest, GetProductListResponse, GetProductListError> {
    
    let getProductListDataManager: GetProductListDataContract
    public init(getProductListDataManager: GetProductListDataContract) {
        self.getProductListDataManager = getProductListDataManager
    }
    
    override public func run(request: GetProductListRequest, success: @escaping (GetProductListResponse) -> Void, failure: @escaping (GetProductListError) -> Void) {
        
        getProductListDataManager.getProductList(userId: request.userId) { [weak self]
            product in
            self?.success(callback: success, productList: product)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping(GetProductListResponse) -> Void, productList: [Product]) {
        let response = GetProductListResponse(products: productList)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping(GetProductListError) -> Void, error: Error) {
        let error = GetProductListError(error: error)
        invokeFailure(callback: callback, failure: error)
    }
            
}
