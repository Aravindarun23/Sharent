//
//  GetProductBookingListDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation

public protocol GetProductBookingListDataBaseContract {
    
    func getProductBookingList(userId: Int, success: @escaping([Order]) -> Void, failure: @escaping (Error) -> Void)
}
