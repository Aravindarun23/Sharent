//
//  SearchProductDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 06/03/23.
//

import Foundation


public class SearchProductDataManager: SearchProductDataContract {
   
    let searchProductDataBase: SearchProductDataBaseContract
    
    public init(searchProductDataBase: SearchProductDataBaseContract) {
        self.searchProductDataBase = searchProductDataBase
    }
    
    public func SearchProduct(pincode: String, product: String, fromDate: String, toDate: String, success: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void) {
        
        searchProductDataBase.SearchProduct(pincode: pincode, product: product, fromDate: fromDate, toDate: toDate) { [weak self]
            products in
            self?.success(callback: success, products: products)
        } failure: {  [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping ([Product]) -> Void, products: [Product]) {
        callback(products)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
}
