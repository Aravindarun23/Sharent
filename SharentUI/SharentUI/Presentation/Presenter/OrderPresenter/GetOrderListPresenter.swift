//
//  GetMyOrderListPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import SharentBackendMacOS

class GetOrderListPresenter {
    
    let getOrderList: GetOrderList
    weak var getOrderListView: GetOrderListViewContract?
    weak var router: Router?
    
    init(getOrderList: GetOrderList) {
        self.getOrderList = getOrderList
    }
    
}

extension GetOrderListPresenter: GetOrderListPresenterContract {
    
    func viewDidLoad(userId: Int) {
        let request = GetOrderListRequest(sellerId: 1)
        getOrderList.execute(request: request) {
            response in
            self.getOrderListView?.load(orders: response.orders)
        } onFailure: { error in
            self.getOrderListView?.failure(error: error.status)
        }
    }
}
