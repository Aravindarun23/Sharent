//
//  ApproveOrderView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation
import VTComponents

class ApproveOrderView: NSView {
    
    let approveOrderPresenter: ApproveOrderPresenterContract
    init(approveOrderPresenter: ApproveOrderPresenterContract) {
        self.approveOrderPresenter = approveOrderPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            approveOrderPresenter.viewDidLoad(orderId: 1)
        }
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ApproveOrderView: ApproveOrderViewContract {
    
    func load(message: String) {
        print(message)
    }
}
