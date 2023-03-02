//
//  DeleteUser.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import VTComponents

public final class DeleteUserRequest: ZRequest {
    
    var userId: Int
    public init(userId: Int) {
        self.userId = userId
        super.init(zuid: "")
    }
}

public final class DeleteUserResponse: ZResponse {
    
    public var responseMsg: String
    init(responseMsg: String) {
        self.responseMsg = responseMsg
    }
    
}

public final class DeleteUserError: ZError {
    
}


public final class DeleteUser: ZUsecase<DeleteUserRequest, DeleteUserResponse, DeleteUserError> {
    
    let deleteUserDataManager: DeleteUserDataContract
    
    public init(deleteUserDataManager: DeleteUserDataContract) {
        self.deleteUserDataManager = deleteUserDataManager
    }
    
    override public func run(request: DeleteUserRequest, success: @escaping (DeleteUserResponse) -> Void, failure: @escaping (DeleteUserError) -> Void) {
        
        deleteUserDataManager.deleteUser(userId: request.userId) { [weak self]
            responseMsg in
            self?.succes(callback: success, message: responseMsg)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
            
        }
    }
    
    private func succes(callback: @escaping (DeleteUserResponse) -> Void, message: String) {
        
        let response = DeleteUserResponse(responseMsg: message)
        callback(response)
        
    }
    
    private func failure(callback: @escaping (DeleteUserError) -> Void, error: Error) {
        
    }
    

}
