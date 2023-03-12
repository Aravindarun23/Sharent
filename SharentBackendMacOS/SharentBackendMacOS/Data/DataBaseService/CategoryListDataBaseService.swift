//
//  CatogeryListDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation


public class CategoryListDataBaseService: CategoryListDataBaseContract {
   
    
    public init() {
        
    }
    
    public func getCategoryList(request: CategoryListRequest, response: @escaping ([Category]) -> Void) {
        
        var categoryList = [Category]()
        
        let result = SelectQuerry.select(tableName: "category")
        
        result?.forEach({ data in
            categoryList.append(Category(id: data["id"] as! Int, name: data["name"] as! String))
        })
        self.sucess(callBack: response, category: categoryList)
        
    }
    
    private func sucess(callBack: @escaping ([Category]) -> Void, category: [Category]) {
        
        callBack(category)
    }
}
