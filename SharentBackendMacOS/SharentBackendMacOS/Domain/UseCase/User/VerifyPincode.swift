//
//  VerifyPincode.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 11/03/23.
//

import Foundation
import VTComponents

public final class VerifyPincodeRequest: ZRequest {
    
    var pincode: String
    public init(pincode: String) {
        self.pincode = pincode
        super.init(zuid: "")
    }
}

public final class VerifyPincodeResponse: ZResponse {
    
    public var pincodeList: [[String: Any]]
    public init(pincodeList: [[String : Any]]) {
        self.pincodeList = pincodeList
    }
}

public final class VerifyPincodeError: ZError {
    
    public enum VerifyError: Error {
        case invalidPincode
    }
    
    public let status: Error
    init(status: Error) {
        self.status = status
        super.init(status: .unknownError)
    }
    
}

public final class VerifyPincode: ZUsecase<VerifyPincodeRequest,VerifyPincodeResponse,VerifyPincodeError> {
    
    let verifyPincodeDataManager: VerifyPincodeDataContract
    public init(verifyPincodeDataManager: VerifyPincodeDataContract) {
        self.verifyPincodeDataManager = verifyPincodeDataManager
    }
    
    override public func run(request: VerifyPincodeRequest, success: @escaping (VerifyPincodeResponse) -> Void, failure: @escaping (VerifyPincodeError) -> Void) {
        verifyPincodeDataManager.verifyPincode(pincode: request.pincode) { [weak self]
            pincodeList in
            self?.success(callback: success, pincodeList: pincodeList)
            
        } failure: { [weak self] error in
            self?.failure(callback: failure, error: error)
        }
    }
    
    private func success(callback: @escaping (VerifyPincodeResponse) -> Void, pincodeList: [[String: Any]]) {
        let response = VerifyPincodeResponse(pincodeList: pincodeList)
        invokeSuccess(callback: callback, response: response)
    }
    
    private func failure(callback: @escaping (VerifyPincodeError) -> Void, error: Error) {
        let error = VerifyPincodeError(status: error)
        invokeFailure(callback: callback, failure: error)
    }
}
