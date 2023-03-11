//
//  Network.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 11/03/23.
//

import Foundation
import VTComponents


public class Network {
    public init() {
        
    }
    
    public func getNetworkData(url: String, httpMethod: String, accessToken: String, callbcak: @escaping ([String: Any]) -> Void, failure: @escaping(Error) -> Void) {
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = httpMethod
   
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(" \(accessToken)", forHTTPHeaderField: "apikey")
        
        
        let session =  URLSession.shared
        session.dataTask(with: request, completionHandler: { (data, response, error)  in
            
            if let data = data {
               
                do {
                    let data = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                   callbcak(data)
                    
                }
                catch {
                    failure(ZErrorType.dataNotFound)
                }
            }
            else {
                failure(ZErrorType.invalidRequestError)
            }
        }).resume()
    }
}
