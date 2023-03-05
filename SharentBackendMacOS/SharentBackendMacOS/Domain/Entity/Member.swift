//
//  Admin.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 22/02/23.
//

import Foundation


public class Member {
    
    public var id: Int
    public var emailId: String
    public var password: String
    
    public init(id: Int, emailId: String, password: String) {
        
        self.id = id
        self.emailId = emailId
        self.password = password
    }
}
