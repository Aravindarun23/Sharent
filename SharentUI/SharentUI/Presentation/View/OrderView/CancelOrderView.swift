//
//  CancelOrderView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 08/03/23.
//

import Foundation
import AppKit

class CancelOrderView: NSView {
    
    let cancelOrderPresenter: CancelOrderPresenterContract
    
    init(cancelOrderPresenter: CancelOrderPresenterContract) {
        self.cancelOrderPresenter = cancelOrderPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            cancelOrderPresenter.ViewDidLoad(orderId: 2)
        }
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CancelOrderView: CancelOrderViewContract {
    
    func load(message: String) {
        print(message)
    }
}
