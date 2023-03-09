//
//  CancelOrderPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 08/03/23.
//

import Foundation
import SharentBackendMacOS

class CancelOrderPresenter {
    
    let cancelOrder: CancelOrder
    weak var cancelOrderView: CancelOrderViewContract?
    weak var router: Router?
    
    init(cancelOrder: CancelOrder) {
        self.cancelOrder = cancelOrder
    }
    
}

extension CancelOrderPresenter: CancelOrderPresenterContract {
    
    func viewDidLoad(orderId: Int) {
        let request = CancelOrderRequest(orderId: orderId )
        cancelOrder.execute(request: request) {
            response in
            self.cancelOrderView?.load(message: response.responseMessage)
        } onFailure: { error in
            
        }
    }
}
