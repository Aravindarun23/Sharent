//
//  VerifyPincodePresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 11/03/23.
//

import Foundation
import SharentBackendMacOS

class VerifyPincodePresenter {
    
    let verifyPincode: VerifyPincode
    weak var verifyPincodeView: VerifyPincodeViewContract?
    weak var router: Router?
    
    init(verifyPincode: VerifyPincode) {
        self.verifyPincode = verifyPincode
    }
}

extension VerifyPincodePresenter: VerifyPincodePresenterContract {
    
    func viewDidLoad(pincode: String) {
        let request = VerifyPincodeRequest(pincode: pincode)
        verifyPincode.execute(request: request) {
            response in
            self.verifyPincodeView?.load(pincodeList: response.pincodeList)
        } onFailure: { error in
            self.verifyPincodeView?.failure(error: error.status)
        }
    }
}
