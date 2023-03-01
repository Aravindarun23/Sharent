//
//  UserSignUp.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation
import VTComponents


public final class AddNewUserRequest: ZRequest {
    
    let user: User
    public init(user: User) {
        self.user = user
        super.init(zuid: "")
    }
}

public final class AddNewUserResponse: ZResponse {
    
    public let responseMessage : String
    init(responseMessage: String) {
        self.responseMessage = responseMessage
    }
        
}

public final class AddNewUserError: ZError {
    
    public let error: Error
    public init(error: Error) {
        self.error = error
        super.init(status: .unknownError)
    }
    
}


public final class AddNewUser: ZUsecase <AddNewUserRequest, AddNewUserResponse, AddNewUserError> {
    
    let addNewUserDataManager : AddNewUserDataContract
    
    public init(addNewUserDataManager: AddNewUserDataContract) {
        self.addNewUserDataManager = addNewUserDataManager
    }
    
    public override func run(request: AddNewUserRequest, success: @escaping (AddNewUserResponse) -> Void, failure: @escaping (AddNewUserError) -> Void) {
        
        addNewUserDataManager.addNewUser(request: request.user) {
            [weak self] (response) in
            self?.success(callback: success, responseMessage: response)
        } failure: { [weak self] (error) in
            self?.failure(callback: failure, error: error)
        }
        
    }
    
    private func success(callback: @escaping (AddNewUserResponse) -> Void, responseMessage: String) {
       
        let response = AddNewUserResponse(responseMessage: responseMessage)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping (AddNewUserError) -> Void, error: Error) {
        let error = AddNewUserError(error: error)
        invokeFailure(callback: callback, failure: error)
    }
    
}
