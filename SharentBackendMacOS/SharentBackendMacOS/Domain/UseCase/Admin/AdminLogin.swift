//
//  AdminLogin.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation
import VTComponents


public final class AdminLoginRequest: ZRequest {
    
    var emailId: String
    var password: String
    
    public init(emailId: String, password: String) {
        self.emailId = emailId
        self.password = password
        super.init(zuid: "")
    }
}

public final class AdminLoginResponse: ZResponse {
    
    public var admin: Admin
    
    public init(admin: Admin) {
        self.admin = admin
    }
    
}

public final class AdminLoginError: ZError {
    
    enum AdminError: Error {
        case invalidEmailId
        case invalidPassword
    }
    
    public var status : Error
    
    public init(error: Error) {
        status = error
        super.init(status: .unknownError)
    }
    
}

public final class AdminLogin: ZUsecase<AdminLoginRequest, AdminLoginResponse, AdminLoginError> {
    
    let adminLoginDataManager: AdminLoginDataContract
    
    public init(adminLoginDataManager: AdminLoginDataContract) {
        self.adminLoginDataManager = adminLoginDataManager
    }
    
    override public func run(request: AdminLoginRequest, success: @escaping (AdminLoginResponse) -> Void, failure: @escaping (AdminLoginError) -> Void) {
        adminLoginDataManager.adminLogin(emailId: request.emailId, password: request.password) { [weak self]
            admin in
            self?.success(callBack: success, admin: admin)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callBack: @escaping (AdminLoginResponse) -> Void, admin: Admin) {
        
        let response = AdminLoginResponse(admin: admin)
        invokeSuccess(callback: callBack, response: response)
    }
    
    private func failure(callback: @escaping (AdminLoginError) -> Void, error: Error) {
        let error = AdminLoginError(error: error)
        invokeFailure(callback: callback, failure: error)
    }
}


