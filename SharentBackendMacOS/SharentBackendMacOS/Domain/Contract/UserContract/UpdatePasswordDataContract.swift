//
//  UpdatePasswordDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation

public protocol UpdatePasswordDataContract {
    
    func updatePassword(userId: Int, newPassword: String, success: @escaping(String) -> Void, failure: @escaping(Error) -> Void)
}
