//
//  GetProductBookedDateView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation
import AppKit

class GetProductBookedDateView: NSView {
    
    let getProductBookedDatePresenter: GetProductBookedDatePresenterContract
    init(getProductBookedDatePresenter: GetProductBookedDatePresenterContract) {
        self.getProductBookedDatePresenter = getProductBookedDatePresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        getProductBookedDatePresenter.viewDidLoad(productId: 1)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension GetProductBookedDateView: GetProductBookedDateViewContract {
    
    func load(dateList: [String]) {
        print(dateList)
    }
}
