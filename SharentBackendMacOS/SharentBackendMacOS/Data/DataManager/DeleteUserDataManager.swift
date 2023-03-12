//
//  DeleteUserDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation

public class DeleteUserDataManager: DeleteUserDataContract {
  
    let deleteUserDataBase: DeleteUserDataBaseContract
    
    public init(deleteUserDataBase: DeleteUserDataBaseContract) {
        self.deleteUserDataBase = deleteUserDataBase
    }
    
    public func deleteUser(userId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        deleteUserDataBase.deleteUser(userId: userId) { [weak self]
            responsemsg in
            
            self?.succes(callback: success, message: responsemsg)
        } failure: { [weak self] error in
            
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func succes(callback: @escaping (String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
}
