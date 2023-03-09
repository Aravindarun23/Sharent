//
//  EditUserDetailsDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation

public class EditUserDetailDataManager: EditUserDetailDataContract {
   
    
    let editUserDetailDataBase: EditUserDetailDataBaseContract
    public init(editUserDetailDataBase: EditUserDetailDataBaseContract) {
        self.editUserDetailDataBase = editUserDetailDataBase
    }
    
    public func editUserDetail(userId: Int, address: String, pincode: String, mobileNumber: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        editUserDetailDataBase.editUserDetail(userId: userId, address: address, pincode: pincode, mobileNumber: mobileNumber) { [weak self]
            responseMsg in
            self?.success(callback: success, message: responseMsg)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping(Error) -> Void, error: Error) {
        callback(error)
    }
    
}
