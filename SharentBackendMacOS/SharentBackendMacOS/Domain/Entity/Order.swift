//
//  Order.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 20/02/23.
//

import Foundation

public struct Order {
    
    public enum Status {
        
        case booked
        case cancelled
        case completed
    }
    
    var id: Int
    var buyer: User
    var product: Product
    var fromDate: String
    var returnDate: String
    var status: Status
    
    public init(id: Int, buyer: User, product: Product, fromDate: String, returnDate: String, status: Status) {
        self.id = id
        self.buyer = buyer
        self.product = product
        self.fromDate = fromDate
        self.returnDate = returnDate
        self.status = status
    }
}
