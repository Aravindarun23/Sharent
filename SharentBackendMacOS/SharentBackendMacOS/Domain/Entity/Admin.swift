//
//  Admin.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 23/02/23.
//

import Foundation

public class Admin: Member {
    
    override init(id: Int, emailId: String, password: String) {
        super.init(id: id, emailId: emailId, password: password)
    }
}
