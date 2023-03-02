//
//  CatogeryListDatabaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation

public protocol CatogeryListDataBaseContract {
    
    func getCatogeryList(request: CatogeryListRequest, response: @escaping ([Category]) -> Void)

}
