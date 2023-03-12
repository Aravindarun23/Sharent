//
//  ApproveOrderDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation


public class ApproveOrderDataBaseService: ApproveOrderDataBaseContract {
    
    public init() {
        
    }
    
    public func approveOrder(orderId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        
        let tableName = "orders"
        
        let updateQuerry = "status = \'\(Order.Status.confirmed.rawValue)\'"
        let whereCondition = "id = \(orderId)"
        
        UpdateQuerry.updateQuerry(tableName: tableName, updateQuerry: updateQuerry, condition: whereCondition) {
            response in
            success("Approved Successfully")
        } error: { error in
            failure(error)
        }
    }
}
