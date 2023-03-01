//
//  Product.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 19/02/23.
//

import Foundation



public struct Product {
    
    public enum Status {
        
        case active
        case inactive
    }
    
    public var Id: Int
    public var seller: User
    public var catogery: Category
    public var name: String
    public var price: Int
    public var detail: String?
    public var uploadedDate: String
    public var status: Status
    
    
    public init(Id: Int, seller: User, catogery: Category, name: String, price: Int, detail: String? = nil, uploadedDate: String, status: Status) {
        
        self.Id = Id
        self.seller = seller
        self.catogery = catogery
        self.name = name
        self.price = price
        self.detail = detail
        self.uploadedDate = uploadedDate
        self.status = status
    }
    
}
