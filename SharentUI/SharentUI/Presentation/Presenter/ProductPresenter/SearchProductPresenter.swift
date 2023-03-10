//
//  SearchProductPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import SharentBackendMacOS

class SearchProductPresenter {
    
    let searchProduct: SearchProduct
    weak var searchProductView: SearchProductViewContract?
    weak var router: Router?
    
    init(searchProduct: SearchProduct, searchProductView: SearchProductViewContract? = nil, router: Router? = nil) {
        self.searchProduct = searchProduct
        self.searchProductView = searchProductView
        self.router = router
    }
}

extension SearchProductPresenter: SearchProductPresenterContract {
    
    func viewDidLoad(productName: String, pincode: String, fromDate: String, toDate: String, filter: SearchProductRequest.Filter?) {
        
        let searchRequest = SearchProductRequest(productName: productName, pincode: pincode, fromDate: fromDate, toDate: toDate, filter: filter)
        searchProduct.execute(request: searchRequest) {
            response in
            self.searchProductView?.load(products: response.products)
        } onFailure: { error in
            self.searchProductView?.failure(error: error.status)
        }
    }
    
}
