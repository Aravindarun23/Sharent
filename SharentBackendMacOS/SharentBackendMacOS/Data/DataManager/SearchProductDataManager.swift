//
//  SearchProductDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 06/03/23.
//

import Foundation


public class SearchProductDataManager: SearchProductDataContract {
   
    let searchProductDataBase: SearchProductDataBaseContract
    let getPincodeListNetwork: GetPincodeListNetworkContract
    
    public init(searchProductDataBase: SearchProductDataBaseContract, getPincodeListNetwork: GetPincodeListNetworkContract) {
        self.searchProductDataBase = searchProductDataBase
        self.getPincodeListNetwork = getPincodeListNetwork
    }
   
    public func SearchProduct(pincode: String, product: String, filter: SearchProductRequest.Filter?, range: Int?, success: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void) {
        
        if let range = range {
            getPincodeListNetwork.getPincodeList(pincode: pincode, range: range) { [weak self]  pincodeList in
                
                self?.searchProductData(pincode: pincodeList, product: product, filter: filter, success: success, failure: failure)
                
            } failure: { [weak self] error in
                
                self?.failure(callback: failure, error: error)
            }
        } else {
            self.searchProductData(pincode: [pincode], product: product, filter: filter, success: success, failure: failure)
                
        }
    }
    
    private func searchProductData(pincode: [String], product: String, filter: SearchProductRequest.Filter?, success: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void)  {
        
        searchProductDataBase.SearchProduct(pincode: pincode, product: product, filter: filter) { [weak self]
            productList in
            
            self?.success(callback: success, products: productList)
        } failure: { error  in
            self.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping ([Product]) -> Void, products: [Product]) {
        callback(products)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
}
