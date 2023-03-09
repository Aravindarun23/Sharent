//
//  EditUserDetailPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation
import SharentBackendMacOS

class EditUserDetailPresenter {
    
    let editUserDetail: EditUserDetail
    weak var editUserDetailView: EditUserDetailViewContract?
    weak var router: Router?
    
    init(editUserDetail: EditUserDetail) {
        self.editUserDetail = editUserDetail
    }
    
}

extension EditUserDetailPresenter: EditUserDetailPresenterContract {
    
    func viewDidLoad(userId: Int, addresss: String, pincode: String, mobileNumber: String) {
        let request = EditUserDetailRequest(userId: userId, address: addresss, pincode: pincode, mobileNumber: mobileNumber)
        editUserDetail.execute(request: request) {
            response in
            self.editUserDetailView?.load(message: response.responseMsg)
        } onFailure: { error in
            
        }
    }
}
