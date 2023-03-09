//
//  GetProductListDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation


public class GetProductListDataManager: GetProductListDataContract {
   
    let getProductListDataBase: GetProductListDataBaseContract
    public init(getProductListDataBase: GetProductListDataBaseContract) {
        self.getProductListDataBase = getProductListDataBase
    }
    
    public func getProductList(userId: Int, sucess: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void) {
        getProductListDataBase.getProductList(userId: userId) { [weak self]
            productList in
            self?.success(callback: sucess, productList: productList)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping([Product]) -> Void, productList: [Product]) {
        callback(productList)
    }
    
    private func failure(callback: @escaping(Error) -> Void, error: Error) {
        callback(error)
    }
}
