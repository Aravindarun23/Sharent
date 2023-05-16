//
//  GetProductBookedDateDataManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation


public class GetProductBookedDateDataManager: GetProductBookedDateDataContract {
    
    let getProductBookedDateDataBase: GetProductBookedDateDataBaseContract
    
    public init(getProductBookedDateDataBase: GetProductBookedDateDataBaseContract) {
        self.getProductBookedDateDataBase = getProductBookedDateDataBase
    }
    
    public func getProductBookedDate(productId: Int, success: @escaping ([String]) -> Void, failure: @escaping (Error) -> Void) {
        
        getProductBookedDateDataBase.getProductBookedDate(productId: productId) { [weak self]
            dateList in
            self?.success(callback: success, dateList: dateList)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping([String]) -> Void, dateList: [String]) {
        callback(dateList)
    }
    
    private func failure(callback: @escaping(Error) -> Void, error: Error) {
        
    }
}
