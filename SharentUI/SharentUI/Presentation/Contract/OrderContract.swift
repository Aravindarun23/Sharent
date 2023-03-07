//
//  OrderContract.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import SharentBackendMacOS

protocol PlaceOrderViewContract: AnyObject {
    func load(message: String)
}

protocol PlaceOrderPresenterContract: AnyObject {
    func viewDidLoad(productId: Int, buyerId: Int, fromDate: String, toDate: String)
}

protocol GetMyOrderListViewContract: AnyObject {
    func load(orders: [Order])
    func failure(error: Error)
}

protocol GetMyOrderListPresenterContract: AnyObject {
    func viewDidLoad(userId: Int)
}