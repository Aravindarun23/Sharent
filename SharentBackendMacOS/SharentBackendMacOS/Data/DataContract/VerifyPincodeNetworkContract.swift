//
//  VerifyPincodeDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 11/03/23.
//

import Foundation

public protocol VerifyPincodeNetworkContract {
    
    func verifyPincode(pincode: String, success: @escaping([[String: Any]]) -> Void, failure: @escaping(Error) -> Void)
}
