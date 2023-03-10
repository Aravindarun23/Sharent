//
//  GetProductBookedDateDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation
import VTComponents

public class GetProductBookedDataBaseService: GetProductBookedDateDataBaseContract {
    
    public init() {
        
    }
    
    
    public func getProductBookedDate(productId: Int, success: @escaping ([[String : Any]]) -> Void, failure: @escaping (Error) -> Void) {
        
        let status = Order.Status.booked.rawValue
        let selectQuerry = "pickUpDate,returnDate"
        let tableName = "orders"
        let whereQuerry = "productId = ? AND status = \'\(status)\'"
        let args: [Any] = [productId, status]
        let result = SelectQuerry.select(tableName: tableName, whereClause: whereQuerry, args: args, selectColumn: selectQuerry)
        
        if let dateList = result {
            success(dateList)
        }
        else {
            failure(ZErrorType.dataNotFound)
        }
    }
}
