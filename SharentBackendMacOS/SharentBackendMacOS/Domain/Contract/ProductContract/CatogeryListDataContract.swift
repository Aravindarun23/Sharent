//
//  CatogeryListDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation

public protocol CatogeryListDataContract {
    
    func getCatogeryList(request: CatogeryListRequest, response: @escaping ([Category]) -> Void)
}
