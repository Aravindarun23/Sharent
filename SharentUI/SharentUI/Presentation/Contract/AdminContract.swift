//
//  AdminContract.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation
import SharentBackendMacOS

protocol AdminLoginViewContract: AnyObject {
    func load(admin: AdminLoginResponse)
}

protocol AdminLoginPresenterContract: AnyObject {
    func viewDidLoad(emailId: String, password: String)
}
