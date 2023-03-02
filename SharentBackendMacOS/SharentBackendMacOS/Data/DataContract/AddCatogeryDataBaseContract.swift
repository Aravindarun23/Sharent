//
//  AddCatogeryDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation

public protocol AddCatogeryDataBaseContract {
    func addCatogery(catogeryName: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
