//
//  CatogeryListDatabaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation

public protocol CategoryListDataBaseContract {
    
    func getCategoryList(request: CategoryListRequest, response: @escaping ([Category]) -> Void)

}
