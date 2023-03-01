//
//  Catogery.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 22/02/23.
//

import Foundation


public struct Category {
    
    public var id: Int
    public var name: String
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
