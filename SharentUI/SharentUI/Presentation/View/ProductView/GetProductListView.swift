//
//  GetProductListView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class GetProductListView: NSView {
    
    let getProductListPresenter : GetProductListPresenterContract
    init(getProductListPresenter: GetProductListPresenterContract) {
        self.getProductListPresenter = getProductListPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        getProductListPresenter.viewDidLoad(userId: 1)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GetProductListView: GetProductListViewContract {
    
    func load(product: [Product]) {
        for product in product {
            print(product)
        }
    }
    
    func failure(error: Error) {
        print(error)
    }
    
    
}
