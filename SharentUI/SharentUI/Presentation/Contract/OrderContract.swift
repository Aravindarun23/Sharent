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

protocol GetOrderListViewContract: AnyObject {
    func load(orders: [Order])
    func failure(error: Error)
}

protocol GetOrderListPresenterContract: AnyObject {
    func viewDidLoad(userId: Int)
}

protocol CancelOrderViewContract: AnyObject {
    func load(message: String)
}

protocol CancelOrderPresenterContract: AnyObject {
    func viewDidLoad(orderId: Int)
}


protocol ApproveOrderViewContract: AnyObject {
    func load(message: String)
}

protocol ApproveOrderPresenterContract: AnyObject {
    func viewDidLoad(orderId: Int)
}
