//
//  SearchProductView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS


class SearchProductView: NSView {
    
    let searchProductPresenter: SearchProductPresenterContract
    
    init(searchProductPresenter: SearchProductPresenterContract) {
        self.searchProductPresenter = searchProductPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        searchProductPresenter.viewDidLoad(productName: "lap", pincode: "123456", fromDate: "2023-01-22", toDate: "2023-01-24")
       
    }
    
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchProductView: SearchProductViewContract {
    
    func load(products: [Product]) {
        for product in products {
            print("PName",product.name)
            print("PDetails", product.detail ?? "")
            print("PUploadDate",product.uploadedDate)
            print("PPrice", product.price)
            print("PCatogery", product.catogery.name)
        }
    }
    
    func failure(error: Error) {
        print(error)
    }
    
    
}
