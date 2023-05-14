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
    
    public var id: Int
    public var buyer: User
    public var product: Product
    public var orderedDate: String
    public var fromDate: String
    public var returnDate: String
    public var status: Status
    
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
