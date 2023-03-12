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
        searchProductPresenter.viewDidLoad(productName: "heli", pincode: "614602",filter: .priceByDesc, range: nil)
       
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchProductView: SearchProductViewContract {
    
    func load(products: [Product]) {
        for product in products {
            print(product.id)
            print("PName",product.name)
            print("PDetails", product.detail ?? "")
            print("PUploadDate",product.uploadedDate)
            print("PPrice", product.price)
            print("PCatogery", product.category.name)
            print("sellerName", product.seller.name)
            print("sellerAddress", product.seller.address)
        }
    }
    
    func failure(error: Error) {
        print(error)
    }
}
