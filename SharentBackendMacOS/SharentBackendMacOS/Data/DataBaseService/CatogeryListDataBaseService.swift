//
//  CatogeryListDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation


public class CatogeryListDataBaseService: CatogeryListDataBaseContract {
   
    
    public init() {
        
    }
    
    public func getCatogeryList(request: CatogeryListRequest, response: @escaping ([Category]) -> Void) {
        
        var catogeryList = [Category]()
        
        let result = SelectQuerry.select(tableName: "catogery")
        
        result?.forEach({ data in
            catogeryList.append(Category(id: data["catogeryId"] as! Int, name: data["catogeryName"] as! String))
        })
        self.sucess(callBack: response, catogery: catogeryList)
        
    }
    
    private func sucess(callBack: @escaping ([Category]) -> Void, catogery: [Category]) {
        
        callBack(catogery)
    }
}
