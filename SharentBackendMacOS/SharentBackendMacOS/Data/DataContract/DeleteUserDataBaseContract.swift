//
//  DeleteUserDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation


public protocol DeleteUserDataBaseContract {
    
    func deleteUser(userId: Int, success: @escaping (String) -> Void, failure: @escaping(Error) -> Void) 
}
