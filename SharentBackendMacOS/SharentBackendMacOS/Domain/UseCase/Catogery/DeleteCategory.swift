//
//  DeleteCatogery.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation
import VTComponents


public final class DeleteCategoryRequest: ZRequest {
    
    var categoryId: Int
    public init(categoryId: Int) {
        self.categoryId = categoryId
        super.init(zuid: "")
    }
}


public final class DeleteCategoryResponse: ZResponse {
    
    public let responseMsg: String
    
    public init(message: String) {
        responseMsg = message
    }
}

public final class DeleteCategoryError: ZError {
    
}

public final class DeleteCategory: ZUsecase<DeleteCategoryRequest, DeleteCategoryResponse, DeleteCategoryError> {
    
    let deleteCategoryDataManager: DeleteCategoryDataContract
    
    public init(deleteCategoryDataManager: DeleteCategoryDataContract) {
        self.deleteCategoryDataManager = deleteCategoryDataManager
    }
    
    override public func run(request: DeleteCategoryRequest, success: @escaping (DeleteCategoryResponse) -> Void, failure: @escaping (DeleteCategoryError) -> Void) {
        deleteCategoryDataManager.deleteCategory(categoryId: request.categoryId) {
            responseMsg in
            self.success(callback: success, message: responseMsg)
        } failure: { error in
            
        }
    }
    
    private func success(callback: @escaping (DeleteCategoryResponse) -> Void, message: String) {
        let response = DeleteCategoryResponse(message: message)
        invokeSuccess(callback: callback, response: response)
    }

    private func failure(callback: @escaping (DeleteCategoryError) -> Void, error: Error) {
       
    }
}

