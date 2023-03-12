//
//  CatogeryListDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation

public protocol CategoryListDataContract {
    
    func getCategoryList(request: CategoryListRequest, response: @escaping ([Category]) -> Void)
}
