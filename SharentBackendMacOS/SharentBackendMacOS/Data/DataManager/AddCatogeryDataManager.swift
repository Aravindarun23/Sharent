//
//  AddCatogeryDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation


public class AddCatogeryDataManager: AddCatogeryDataContract {
    
    
    let addCatogeryDataBase: AddCatogeryDataBaseContract
    
    public init(addCatogeryDataBase: AddCatogeryDataBaseContract) {
        self.addCatogeryDataBase = addCatogeryDataBase
    }
    
    
    public func addCatogery(catogeryName: String, success: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        addCatogeryDataBase.addCatogery(catogeryName: catogeryName) { [weak self]
        responseMsg in
            self?.success(callback: success, message: responseMsg)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (String) -> Void, message: String) {
        callback(message)
    }
    
    private func failure(callback: @escaping (Error) -> Void, error: Error) {
        callback(error)
    }
    
}
