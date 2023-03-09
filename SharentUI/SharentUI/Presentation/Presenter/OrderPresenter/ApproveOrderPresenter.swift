//
//  ApproveOrderPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation
import SharentBackendMacOS

class ApproveOrderPresenter {
    
    let approveOrder: ApproveOrder
    weak var approveOrderView: ApproveOrderViewContract?
    weak var router: Router?
    
    init(approveOrder: ApproveOrder, approveOrderView: ApproveOrderViewContract? = nil, router: Router? = nil) {
        self.approveOrder = approveOrder
        self.approveOrderView = approveOrderView
        self.router = router
    }
    
}

extension ApproveOrderPresenter: ApproveOrderPresenterContract {
   
    func viewDidLoad(orderId: Int) {
        let request = ApproveOrderRequest(orderId: orderId)
        approveOrder.execute(request: request) {
            response in
            self.approveOrderView?.load(message: response.responseMessage)
        } onFailure: { error in
            
        }
    }
}
