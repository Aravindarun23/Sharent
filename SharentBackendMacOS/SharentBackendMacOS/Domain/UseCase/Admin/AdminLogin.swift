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
    
    init(admin: Admin) {
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
    
    let adminLogin: AdminLoginDataContract
    
    public init(adminLogin: AdminLoginDataContract) {
        self.adminLogin = adminLogin
    }
    
    override public func run(request: AdminLoginRequest, success: @escaping (AdminLoginResponse) -> Void, failure: @escaping (AdminLoginError) -> Void) {
        adminLogin.adminLogin(emailId: request.emailId, password: request.password) { [weak self]
            admin in
            self?.success(callBack: success, admin: admin)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callBack: @escaping (AdminLoginResponse) -> Void, admin: Admin) {
        
        let response = AdminLoginResponse(admin: admin)
        callBack(response)
    }
    
    private func failure(callback: @escaping (AdminLoginError) -> Void, error: Error) {
        let error = AdminLoginError(error: error)
        callback(error)
    }
}


