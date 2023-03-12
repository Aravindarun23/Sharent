//
//  CatogeryLIstDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation


public class CategoryListDataManager: CategoryListDataContract {
  
    
    let categorylistDataBaseService: CategoryListDataBaseContract
    
    public init(categorylistDataBaseService: CategoryListDataBaseContract) {
        self.categorylistDataBaseService = categorylistDataBaseService
    }
    
    public func getCategoryList(request: CategoryListRequest, response: @escaping ([Category]) -> Void) {
        
        categorylistDataBaseService.getCategoryList(request: request) { [weak self] category in
            
            self?.sucess(callBack: response, category: category)
        }
    }
    
    private func sucess(callBack: @escaping ([Category]) -> Void, category: [Category]) {
        callBack(category)
    }
    
}
