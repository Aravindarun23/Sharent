//
//  GetProductAvailableDate.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation
import VTComponents

public final class GetProductBookedDateRequest: ZRequest {
    
    let productId: Int
    public init(productId: Int) {
        self.productId = productId
        super.init(zuid: "")
    }
    
}

public final class GetProductBookedDateResponse: ZResponse {
    
    public var dateList: [[String: Any]]
    init(dateList: [[String : Any]]) {
        self.dateList = dateList
    }
}

public final class GetProductBookedDateZerror: ZError {
    
}

public final class GetProductBookedDate: ZUsecase<GetProductBookedDateRequest, GetProductBookedDateResponse, GetProductBookedDateZerror> {
    
    let getProductBookedDateDataManager: GetProductBookedDateDataContract
    
    public init(getProductBookedDateDataManager: GetProductBookedDateDataContract) {
        self.getProductBookedDateDataManager = getProductBookedDateDataManager
    }
    
    override public func run(request: GetProductBookedDateRequest, success: @escaping (GetProductBookedDateResponse) -> Void, failure: @escaping (GetProductBookedDateZerror) -> Void) {
        getProductBookedDateDataManager.getProductBookedDate(productId: request.productId) {
            dateList in
            self.success(callback: success, dateList: dateList)
        } failure: { error in
            
        }
    }
    
    private func success(callback: @escaping(GetProductBookedDateResponse) -> Void, dateList: [[String: Any]]) {
        let response = GetProductBookedDateResponse(dateList: dateList)
        callback(response)
    }
    
    private func failure(callback: @escaping(Error) -> Void, error: Error) {
        
    }
}