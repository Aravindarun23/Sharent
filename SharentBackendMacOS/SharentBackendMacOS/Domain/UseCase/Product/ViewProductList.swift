//
//  ViewProductList.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation
import VTComponents


public final class ViewProductListRequest: ZRequest {
    
    public var usrerId: Int
    public init(usrerId: Int) {
        self.usrerId = usrerId
        super.init(zuid: "")
    }
    
}

public final class ViewProductListResponse: ZResponse {
    
    public let products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
    
    
}

public final class ViewProductListError: ZError {
    
}

public class ViewProductList: ZUsecase<ViewProductListRequest, ViewProductListResponse, ViewProductListError> {
            
}
