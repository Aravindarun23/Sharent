//
//  GetMyOrderListVIew.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class GetOrderListView: NSView {
    
    let getOrderListPresenter: GetOrderListPresenterContract
    
    init(getOrderListPresenter: GetOrderListPresenterContract) {
        self.getOrderListPresenter = getOrderListPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            getOrderListPresenter.viewDidLoad(userId: 1)
        }
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GetOrderListView: GetOrderListViewContract {
    func load(orders: [Order]) {
        for order in orders {
            print(order)
        }
    }
    
    func failure(error: Error) {
        print(error)
    }
}
