//
//  getPincodeListNetworkContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 11/03/23.
//

import Foundation


public protocol GetPincodeListNetworkContract {
    
    func getPincodeList(pincode: String, range: Int, success: @escaping([String]) -> Void, failure: @escaping (Error) -> Void)
}
