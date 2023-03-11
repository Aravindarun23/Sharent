//
//  VerifyPincodeDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 11/03/23.
//

import Foundation

public class VerifyPincodeDataManager: VerifyPincodeDataContract {
    
    let verifyPincodeNetworkService: VerifyPincodeNetworkContract
    
    public init(verifyPincodeNetworkService: VerifyPincodeNetworkContract) {
        self.verifyPincodeNetworkService = verifyPincodeNetworkService
    }
    
    public func verifyPincode(pincode: String, success: @escaping ([[String : Any]]) -> Void, failure: @escaping (Error) -> Void) {
        
        verifyPincodeNetworkService.verifyPincode(pincode: pincode) { [weak self]
            pincodeList in
            self?.success(callback: success, pincodeList: pincodeList)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping ([[String:Any]]) -> Void, pincodeList: [[String: Any]]) {
        callback(pincodeList)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
}
