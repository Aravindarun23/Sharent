//
//  ViewProductListDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation

public protocol GetProductListDataBaseContract {
    
    func getProductList(userId: Int, sucess: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void)
}
