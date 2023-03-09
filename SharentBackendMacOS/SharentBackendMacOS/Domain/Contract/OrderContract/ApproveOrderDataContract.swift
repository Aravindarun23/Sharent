//
//  ApproveOrderDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation

public protocol ApproveOrderDataContract {
    func approveOrder(orderId: Int,success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
