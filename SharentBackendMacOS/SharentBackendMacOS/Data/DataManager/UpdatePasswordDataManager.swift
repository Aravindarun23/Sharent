//
//  UpdatePasswordDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation

public class UpdatePasswordDataManager: UpdatePasswordDataContract {
    
    let updatePasswordDataBase: UpdatePasswordDataBaseContract
    public init(updatePasswordDataBase: UpdatePasswordDataBaseContract) {
        self.updatePasswordDataBase = updatePasswordDataBase
    }
    
    public func updatePassword(userId: Int, newPassword: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        updatePasswordDataBase.updatePassword(userId: userId, newPassword: newPassword) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping(String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping(Error) -> Void, error: Error) {
        callback(error)
    }
}
