//
//  GetCatogeryList.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import VTComponents

public final class CatogeryListRequest: Request {
    
}

public final class CatogeryListResponse: ZResponse {
    
    public let catogeryList: [Category]
    
    init(catogeryList: [Category]) {
        self.catogeryList = catogeryList
        super.init()
    }
}

public final class CatogeryListError: ZError {
    
}


public final class GetCatogeryList: ZUsecase<CatogeryListRequest, CatogeryListResponse, CatogeryListError>  {
    
    let catogeryListDataManager: CatogeryListDataContract
    
    public init(catogeryListDataManager: CatogeryListDataContract) {
        self.catogeryListDataManager = catogeryListDataManager
    }
    
    override public func run(request: CatogeryListRequest, success: @escaping (CatogeryListResponse) -> Void, failure: @escaping (CatogeryListError) -> Void) {
        catogeryListDataManager.getCatogeryList(request: request) {
            catogery in
            self.sucess(callBack: success, catogery: catogery)
        }
    }
    
    private func sucess(callBack: @escaping (CatogeryListResponse) -> Void, catogery: [Category]) {
        
        let response = CatogeryListResponse(catogeryList: catogery)
        invokeSuccess(callback: callBack, response: response)
    }
    
    
                
}
