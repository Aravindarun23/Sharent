//
//  AddCategory.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import VTComponents

public final class AddCategoryRequest: ZRequest {
    
    let categoryName: String
    public init(categoryName: String) {
        self.categoryName = categoryName
        super.init(zuid: "")
    }
    
}

public final class AddCategoryResponse: ZResponse {
    
    public let responseMsg: String
    
    public init(message: String) {
        responseMsg = message
    }
    
}

public final class AddCategoryError: ZError {
    
}


public final class AddCategory: ZUsecase<AddCategoryRequest, AddCategoryResponse, AddCategoryError> {
    
    let addCategoryDataManager: AddCategoryDataContract
    
    public init(addCategoryDataManager: AddCategoryDataContract) {
        self.addCategoryDataManager = addCategoryDataManager
    }
    
    override public func run(request: AddCategoryRequest, success: @escaping (AddCategoryResponse) -> Void, failure: @escaping (AddCategoryError) -> Void) {
        
        addCategoryDataManager.addCategory(categoryName: request.categoryName) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
            
        } failure: { error in
            
        }
    }
    
    private func success(callback: @escaping (AddCategoryResponse) -> Void, message: String) {
        let response = AddCategoryResponse(message: message)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        
    }
    
    
        
}
