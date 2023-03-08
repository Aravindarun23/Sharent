//
//  ViewMyOrderDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation

public protocol GetOrderListDataContract {
    func getOrderList(buyerId: Int?, sellerId: Int?, success: @escaping([Order]) -> Void, failure: @escaping (Error) -> Void)
}
