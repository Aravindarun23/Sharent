//
//  Order.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 20/02/23.
//

import Foundation

public struct Order {
    
    public enum Status: String {
        
        case requested = "requested"
        case confirmed = "confirmed"
        case cancelled = "cancelled"
        case completed = "completed"
    }
    
    var id: Int
    var buyer: User
    var product: Product
    var orderedDate: String
    var fromDate: String
    var returnDate: String
    var status: Status
    
   public init(id: Int, buyer: User, product: Product, orderedDate: String, fromDate: String, returnDate: String, status: Status) {
        self.id = id
        self.buyer = buyer
        self.product = product
        self.orderedDate = orderedDate
        self.fromDate = fromDate
        self.returnDate = returnDate
        self.status = status
    }
}
