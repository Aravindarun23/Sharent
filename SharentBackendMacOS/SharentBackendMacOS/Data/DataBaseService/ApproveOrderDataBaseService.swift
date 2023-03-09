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
        let status = Order.Status(rawValue: "booked")
        
        guard let status = status else {return}
        let updateQuerry = "status = \'\(status.rawValue)\'"
        let whereCondition = "id = \(orderId)"
        
        UpdateQuerry.updateQuerry(tableName: tableName, updateQuerry: updateQuerry, condition: whereCondition) {
            response in
            success("Approved Successfully")
        } error: { error in
            failure(error)
        }
    }
}
