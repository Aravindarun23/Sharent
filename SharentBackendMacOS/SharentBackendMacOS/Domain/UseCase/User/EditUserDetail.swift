//
//  EditUserInfo.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation
import VTComponents

public final class EditUserDetailRequest: ZRequest {
    
    let userId: Int
    let address: String
    let pincode: String
    let mobileNumber: String
    
    public init(userId: Int, address: String, pincode: String, mobileNumber: String) {
        self.userId = userId
        self.address = address
        self.pincode = pincode
        self.mobileNumber = mobileNumber
        super.init(zuid: "")
    }
}

public final class EditUserDetailResponse: ZResponse {
    
    public  var responseMsg: String
    public init(responseMsg: String) {
        self.responseMsg = responseMsg
    }
}

public final class EditUserDetailError: ZError {
    
}

public final class EditUserDetail: ZUsecase<EditUserDetailRequest, EditUserDetailResponse, EditUserDetailError> {
    
    let editUserDetailDataManager : EditUserDetailDataContract
    public init(editUserDetailDataManager: EditUserDetailDataContract) {
        self.editUserDetailDataManager = editUserDetailDataManager
    }
    
    override public func run(request: EditUserDetailRequest, success: @escaping (EditUserDetailResponse) -> Void, failure: @escaping (EditUserDetailError) -> Void) {
        editUserDetailDataManager.editUserDetail(userId: request.userId, address: request.address, pincode: request.pincode, mobileNumber: request.mobileNumber) {
            responseMsg in
            self.success(callback: success, message: responseMsg)
            
        } failure: { error in
            self.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (EditUserDetailResponse) -> Void, message: String) {
        let response = EditUserDetailResponse(responseMsg: message)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping(EditUserDetailError) -> Void, error: Error) {

    }
    
}
