//
//  EditUserDetailDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation


public protocol EditUserDetailDataContract {
    
    func editUserDetail(userId: Int, address: String, pincode: String, mobileNumber: String, success: @escaping(String) -> Void, failure: @escaping (Error) -> Void)
}
