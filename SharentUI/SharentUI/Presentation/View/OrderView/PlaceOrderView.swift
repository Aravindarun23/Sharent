//
//  PlaceOrderView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import AppKit

class PlaceOrderView: NSView {
    
    let placeOrderPresenter: PlaceOrderPresenterContract
    init(placeOrderPresenter: PlaceOrderPresenterContract) {
        self.placeOrderPresenter = placeOrderPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {

        if superview != nil {
            placeOrderPresenter.viewDidLoad(productId: 1 , buyerId: 2, fromDate: "2023-01-15", toDate: "2023-01-18")
        }
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PlaceOrderView: PlaceOrderViewContract {

    func load(message: String) {
        print(message)
    }
}
