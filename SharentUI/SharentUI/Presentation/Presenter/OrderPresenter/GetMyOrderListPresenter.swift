//
//  GetMyOrderListPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import SharentBackendMacOS

class GetMyOrderListPresenter {
    
    let getMyOrder: GetMyOrder
    weak var getMyOrderListView: GetMyOrderListViewContract?
    weak var router: Router?
    
    init(getMyOrder: GetMyOrder) {
        self.getMyOrder = getMyOrder
    }
    
}

extension GetMyOrderListPresenter: GetMyOrderListPresenterContract {
    
    func viewDidLoad(userId: Int) {
        let request = GetMyOrderRequset(userId: userId)
        getMyOrder.execute(request: request) {
            response in
            self.getMyOrderListView?.load(orders: response.orders)
        } onFailure: { error in
            self.getMyOrderListView?.failure(error: error.status)
        }
    }
}
