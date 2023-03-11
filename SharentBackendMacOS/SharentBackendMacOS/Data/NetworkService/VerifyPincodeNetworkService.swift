//
//  VerifyPincodeNetworkService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 11/03/23.
//

import Foundation
import VTComponents

public class VerifyPincodeNetworkService: VerifyPincodeNetworkContract {
    
    public init() {
        
    }
    
    let network = Network()
    
    public func verifyPincode(pincode: String, success: @escaping ([[String : Any]]) -> Void, failure: @escaping (Error) -> Void) {
        
        let urlString = "https://app.zipcodebase.com/api/v1/search?codes=\(pincode)&country=In"
        let accessToken = "bacfae70-b108-11ed-84a2-950e7a5112fe"
        let httpMethod = "GET"
        var pincodeList = [[String: Any]]()
        
        network.getNetworkData(url: urlString, httpMethod: httpMethod, accessToken: accessToken) {
            data in
            if let rows = data["results"] as? [String: [[String: Any]]] {
                if let detail = rows[pincode] {
                    for row in detail {
                        var detail = [String: Any]()
                        detail["city"] = row["city"]
                        detail["state"] = row["state"]
                        pincodeList.append(detail)
                    }
                    success(pincodeList)
                }
            }
            else {
                failure(VerifyPincodeError.VerifyError.invalidPincode)
            }
            
        } failure: { error  in
            failure(error)
        }
    }
}
