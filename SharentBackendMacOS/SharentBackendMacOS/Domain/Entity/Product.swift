//
//  Product.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 19/02/23.
//

import Foundation



public struct Product {
    
    public enum Status: String {
        
        case active = "active"
        case inactive = "inActive"
    }
    
    // MARK: add rawValue
    
    public var id: Int
    public var seller: User
    public var category: Category
    public var image: [String]?
    public var name: String
    public var price: Int
    public var detail: String?
    public var uploadedDate: String
    public var status: Status
    
    
    public init(id: Int, seller: User, category: Category, image: [String]? = nil, name: String, price: Int, detail: String? = nil, uploadedDate: String, status: Status) {
        self.id = id
        self.seller = seller
        self.category = category
        self.image = image
        self.name = name
        self.price = price
        self.detail = detail
        self.uploadedDate = uploadedDate
        self.status = status
    }
    
}
