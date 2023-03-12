//
//  GetCatogeryList.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import VTComponents

public final class CategoryListRequest: Request {
    
}

public final class CategoryListResponse: ZResponse {
    
    public let categoryList: [Category]
    
    init(categoryList: [Category]) {
        self.categoryList = categoryList
        super.init()
    }
}

public final class CategoryListError: ZError {
    
}


public final class GetCategoryList: ZUsecase<CategoryListRequest, CategoryListResponse, CategoryListError>  {
    
    let categoryListDataManager: CategoryListDataContract
    
    public init(categoryListDataManager: CategoryListDataContract) {
        self.categoryListDataManager = categoryListDataManager
    }
    
    override public func run(request: CategoryListRequest, success: @escaping (CategoryListResponse) -> Void, failure: @escaping (CategoryListError) -> Void) {
        categoryListDataManager.getCategoryList(request: request) {
            category in
            self.sucess(callBack: success, category: category)
        }
    }
    
    private func sucess(callBack: @escaping (CategoryListResponse) -> Void, category: [Category]) {
        
        let response = CategoryListResponse(categoryList: category)
        invokeSuccess(callback: callBack, response: response)
    }
    
    
                
}
