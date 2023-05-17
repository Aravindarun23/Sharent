//
//  SearchProduct.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 06/03/23.
//

import Foundation
import VTComponents

public final class SearchProductRequest: ZRequest {
    
    var productName: String
    var pincode : String
    var filter: Filter?
    var range: Int?
    
    public enum Filter: String {
        
        case dateByAsc = "uploadedDate ASC"
        case dateByDesc = "uploadedDate DESC"
        case priceByAsc = "price ASC"
        case priceByDesc = "price DESC"
    }
    
    public init(productName: String, pincode: String, filter: Filter? = nil, range: Int? = nil) {
        self.productName = productName
        self.pincode = pincode
        self.filter = filter
        self.range = range
        super.init(zuid: "")
    }
    
}

public final class SearchProductResponse: ZResponse {
    
    public var products: [Product]
    
    public init(products: [Product]) {
        self.products = products
    }
    
}

public final class SearchProductError: ZError {
    
    enum SearchProductError: Error {
        case noProductFound
    }
    
    public var status : Error
    
    public init(error: Error) {
        status = error
        super.init(status: .unknownError)
    }
}


public final class SearchProduct: ZUsecase<SearchProductRequest, SearchProductResponse, SearchProductError> {
    
    let searchProductDataManger : SearchProductDataContract
    
    public init(searchProductDataManger: SearchProductDataContract) {
        self.searchProductDataManger = searchProductDataManger
    }
    
    override public func run(request: SearchProductRequest, success: @escaping (SearchProductResponse) -> Void, failure: @escaping (SearchProductError) -> Void) {
        searchProductDataManger.searchProduct(pincode: request.pincode, product: request.productName, filter: request.filter, range: request.range) { [weak self]
            products in
            self?.success(callback: success, products: products)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (SearchProductResponse) -> Void, products: [Product]) {
        let response = SearchProductResponse(products: products)
        invokeSuccess(callback: callback, response: response)
        
    }
    
    private func failure(callback: @escaping (SearchProductError) -> Void, error: Error) {
        let error = SearchProductError(error: error)
        invokeFailure(callback: callback, failure: error)
    }

            
}
