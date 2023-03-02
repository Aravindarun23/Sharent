//
//  AddCatogery.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import VTComponents

public final class AddCatogeryRequest: ZRequest {
    
    let catogeryName: String
    public init(catogeryName: String) {
        self.catogeryName = catogeryName
        super.init(zuid: "")
    }
    
}

public final class AddCatogeryResponse: ZResponse {
    
    public let responseMsg: String
    
    public init(message: String) {
        responseMsg = message
    }
    
}

public final class AddCatogeryError: ZError {
    
}


public final class AddCatogery: ZUsecase<AddCatogeryRequest, AddCatogeryResponse, AddCatogeryError> {
    
    let addCatogeryDataManager: AddCatogeryDataContract
    
    public init(addCatogeryDataManager: AddCatogeryDataContract) {
        self.addCatogeryDataManager = addCatogeryDataManager
    }
    
    override public func run(request: AddCatogeryRequest, success: @escaping (AddCatogeryResponse) -> Void, failure: @escaping (AddCatogeryError) -> Void) {
        
        addCatogeryDataManager.addCatogery(catogeryName: request.catogeryName) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
            
        } failure: { error in
            
        }
    }
    
    private func success(callback: @escaping (AddCatogeryResponse) -> Void, message: String) {
        let response = AddCatogeryResponse(message: message)
        callback(response)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
    
    
        
}
