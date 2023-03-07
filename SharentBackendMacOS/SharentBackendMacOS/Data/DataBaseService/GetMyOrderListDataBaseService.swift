//
//  GetMyOrderListDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation


public class GetMyOrderListDataBaseService: GetMyOrderListDataBaseContract {
    
    public init() {
        
    }
    
    public func getMyOrderList(userId: Int, success: @escaping ([Order]) -> Void, failure: @escaping (Error) -> Void) {
        
        let tableName = "orders"
        let whereQuerry = "buyerId = ?"
        let args = [userId]
        var orders = [Order]()
        
        let result = SelectQuerry.select(tableName: tableName,whereClause: whereQuerry,args: args)
        if result?.count != 0  {
            for order in result! {
                orders.append(order)
            }
            success(orders)
            print(orders)
        }
        else {
            failure(GetMyOrderError.orderListError.noOrderFound)
        }
    }
}
