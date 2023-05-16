//
//  GetProductBookedDateDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation

public protocol GetProductBookedDateDataBaseContract {
    
    func getProductBookedDate(productId: Int,success: @escaping ([String]) -> Void, failure: @escaping (Error) -> Void)
}
