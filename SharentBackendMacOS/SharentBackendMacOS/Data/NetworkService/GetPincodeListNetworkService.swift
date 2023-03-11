//
//  GetPincodeListNetworkService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 11/03/23.
//

import Foundation
import VTComponents

public class GetPincodeNetworkService: GetPincodeListNetworkContract {
    
    public init() {
        
    }
    
    let network = Network()
   
    
    public func getPincodeList(pincode: String, range: Int, success: @escaping ([String]) -> Void, failure: @escaping (Error) -> Void) {
        
        let urlString = "https://app.zipcodebase.com/api/v1/radius?code=\(pincode)&radius=\(range)&country=In"
        let accessToken = "bacfae70-b108-11ed-84a2-950e7a5112fe"
        let httpMethod = "GET"
        var pincodes = [String]()
        network.getNetworkData(url: urlString, httpMethod: httpMethod, accessToken: accessToken) {
            pincodeList in
            let data = pincodeList["results"] as? [[String: Any]]
            
            if let data = data {
                
                for result in data {
                    pincodes.append((result["code"]) as! String)
                }
                success(pincodes)
            }
            else {
                failure(ZErrorType.dataNotFound)
            }
            
        } failure: { error in
            failure(ZErrorType.networkUnavailable)
        }
    }
}
