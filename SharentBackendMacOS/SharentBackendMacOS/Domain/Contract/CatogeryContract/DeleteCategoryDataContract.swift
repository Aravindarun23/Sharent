//
//  DeleteCategoryDataContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation

public protocol DeleteCategoryDataContract {
    func deleteCatogery(catogeryId: Int, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void)
}
