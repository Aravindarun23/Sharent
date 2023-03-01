//
//  UserLogin.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 27/02/23.
//

import Foundation
import VTComponents


public final class UserLoginRequest: ZRequest {
    
    var emailId: String
    var password: String
    
    public init(emailId: String, password: String) {
        self.emailId = emailId
        self.password = password
        super.init(zuid: "")
    }
}

public final class UserLoginResponse: ZResponse {
    
    public var user: User
    
    init(user: User) {
        self.user = user
    }
}

public final class UserLoginError: ZError {
    
    enum LoginError: Error {
        case invalidEmailId
        case invalidPassword
    }
    
    public var status : Error
    
    public init(error: Error) {
        status = error
        super.init(status: .unknownError)
    }
}

public final class UserLogin: ZUsecase<UserLoginRequest, UserLoginResponse, UserLoginError> {
    
    let userLoginDataManager: UserLoginDataContract
    
    public init(userLoginDataManager: UserLoginDataContract) {
        self.userLoginDataManager = userLoginDataManager
    }
    
    public override func run(request: UserLoginRequest, success: @escaping (UserLoginResponse) -> Void, failure: @escaping (UserLoginError) -> Void) {
        
        userLoginDataManager.userLogin(emailId: request.emailId, password: request.password) {
            response in
            self.success(callback: success, user: response)
        } failure: {
            error in
            self.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (UserLoginResponse) -> Void, user: User) {
        let response = UserLoginResponse(user: user)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping (UserLoginError) -> Void, error: Error) {
        let error = UserLoginError(error: error)
        invokeFailure(callback: callback, failure: error)
    }
}
