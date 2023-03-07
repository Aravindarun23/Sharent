//
//  Order.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 20/02/23.
//

import Foundation

public struct Order {
    
    var seller: User
    var buyer: User
    var product: Product
    var fromDate: String
    var returnDate: String
    
    public init(seller: User, buyer: User, product: Product, fromDate: String, returnDate: String) {
        self.seller = seller
        self.buyer = buyer
        self.product = product
        self.fromDate = fromDate
        self.returnDate = returnDate
    }
}
