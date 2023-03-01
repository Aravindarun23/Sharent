//
//  User.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation

public class User: Member {
    
    public var name: String
    public var mobileNumber: String
    public var address: String
    public var pincode: String
    
    
    public init(id: Int, name: String, emailId: String, password: String, mobileNumber: String, address: String, pincode: String) {
        
        self.name = name
        self.mobileNumber = mobileNumber
        self.address = address
        self.pincode = pincode
        super.init(id: id, emailId: emailId, password: password)
    }
}
