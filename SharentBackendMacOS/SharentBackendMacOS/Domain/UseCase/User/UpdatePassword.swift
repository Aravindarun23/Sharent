//
//  UpdatePassword.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation
import VTComponents

public class UpdatePasswordRequest: ZRequest {
    
    var userId: Int
    var newPassword: String
    
    public init(userId: Int, newPassword: String) {
        self.userId = userId
        self.newPassword = newPassword
        super.init(zuid: "")
    }
    
}

public class UpdatePasswordResponse: ZResponse {
    
    public var responseMsg: String
    init(responseMsg: String) {
        self.responseMsg = responseMsg
    }
}

public class UpdatePasswordError: ZError {
    
}

public class UpdatePassword: ZUsecase<UpdatePasswordRequest, UpdatePasswordResponse, UpdatePasswordError> {
    
    let updatePasswordDataManager: UpdatePasswordDataContract
    public init(updatePasswordDataManager: UpdatePasswordDataContract) {
        self.updatePasswordDataManager = updatePasswordDataManager
    }
    
    override public func run(request: UpdatePasswordRequest, success: @escaping (UpdatePasswordResponse) -> Void, failure: @escaping (UpdatePasswordError) -> Void) {
        updatePasswordDataManager.updatePassword(userId: request.userId, newPassword: request.newPassword) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping(UpdatePasswordResponse) -> Void, message: String) {
        let response = UpdatePasswordResponse(responseMsg: message)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping(UpdatePasswordError) -> Void, error: Error) {
        
    }
    
}
