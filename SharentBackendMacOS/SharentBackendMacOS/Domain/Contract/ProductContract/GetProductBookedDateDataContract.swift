//
//  GetProductBookedDateDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation

public protocol GetProductBookedDateDataContract {
    
    func getProductBookedDate(productId: Int,success: @escaping ([[String:Any]]) -> Void, failure: @escaping (Error) -> Void)
}
