//
//  ApproveOrderDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation

public class ApproveOrderDataManager: ApproveOrderDataContract {
    
    let approveOrderDataBase: ApproveOrderDataBaseContract
    public init(approveOrderDataBase: ApproveOrderDataBaseContract) {
        self.approveOrderDataBase = approveOrderDataBase
    }
    
    public func approveOrder(orderId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        approveOrderDataBase.approveOrder(orderId: orderId) { [weak self]
        responseMsg in
            self?.success(callback: success, message: responseMsg)
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping(String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping(Error) -> Void, error: Error) {
        callback(error )
    }
}
