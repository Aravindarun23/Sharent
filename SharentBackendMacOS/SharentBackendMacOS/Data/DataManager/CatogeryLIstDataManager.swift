//
//  CatogeryLIstDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation


public class CatogeryListDataManager: CatogeryListDataContract {
  
    
    let catogerylistDataBaseService: CatogeryListDataBaseContract
    
    public init(catogerylistDataBaseService: CatogeryListDataBaseContract) {
        self.catogerylistDataBaseService = catogerylistDataBaseService
    }
    
    public func getCatogeryList(request: CatogeryListRequest, response: @escaping ([Category]) -> Void) {
        
        catogerylistDataBaseService.getCatogeryList(request: request) { [weak self] catogery in
            
            self?.sucess(callBack: response, catogery: catogery)
        }
    }
    
    private func sucess(callBack: @escaping ([Category]) -> Void, catogery: [Category]) {
        callBack(catogery)
    }
    
}
