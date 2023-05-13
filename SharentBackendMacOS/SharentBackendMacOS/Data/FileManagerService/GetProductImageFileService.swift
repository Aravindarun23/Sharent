//
//  GetProductImageFileService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 05/05/23.
//

import Foundation

public class GetProductImageFileService: GetProductImageFileContract {
    
    public init() {
        
    }
    let fileManager = File()
    
    public func getProductImageFile(products: [Product], callback: @escaping ([Product]) -> Void) {
        
        let products = fileManager.getProductImageFile(products: products)
        success(products: products, callBack: callback)
    }
    
    private func success(products: [Product], callBack: @escaping ([Product]) -> Void) {
        callBack(products)
    }
}
