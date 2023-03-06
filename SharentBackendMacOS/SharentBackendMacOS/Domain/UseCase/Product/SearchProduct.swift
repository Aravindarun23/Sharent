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
    var fromDate: String
    var toDate: String
    
    public init(productName: String, pincode: String, fromDate: String, toDate: String) {
        self.productName = productName
        self.pincode = pincode
        self.fromDate = fromDate
        self.toDate = toDate
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
    
    
    
    
}


public final class SearchProduct: ZUsecase<SearchProductRequest, SearchProductResponse, SearchProductError> {
            
}
