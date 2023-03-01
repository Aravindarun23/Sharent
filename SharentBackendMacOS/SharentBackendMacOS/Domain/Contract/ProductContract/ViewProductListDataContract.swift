//
//  ViewProductListDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation

public protocol ViewProductListDataContract {
    
    func viewProductList(userId: String, sucess: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void)
}
