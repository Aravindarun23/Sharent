//
//  PlaceOrderPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import SharentBackendMacOS

class PlaceOrderPresenter {
    
    let placeOrder: PlaceOrder
    weak var placeOrderView: PlaceOrderViewContract?
    weak var router: Router?
    
    init(placeOrder: PlaceOrder, placeOrderView: PlaceOrderViewContract? = nil, router: Router? = nil) {
        self.placeOrder = placeOrder
        self.placeOrderView = placeOrderView
        self.router = router
    }
}

extension PlaceOrderPresenter: PlaceOrderPresenterContract {
    
    func viewDidLoad(productId: Int, buyerId: Int, fromDate: String, toDate: String) {
        let request = PlaceOrderRequest(productId: productId, buyerId: buyerId, fromDate: fromDate, toDate: toDate)
        placeOrder.execute(request: request) {
            response in
            self.placeOrderView?.load(message: response.responseMessage)
        } onFailure: { error in
            
        }
    }
}
