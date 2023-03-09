//
//  GetProductListPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation
import SharentBackendMacOS

class GetProductListPresenter {
    
    let getProductList: GetProductList
    weak var getProductListView: GetProductListViewContract?
    weak var router: Router?
    
    init(getProductList: GetProductList) {
        self.getProductList = getProductList
    }
    
}

extension GetProductListPresenter: GetProductListPresenterContract {
    
    func viewDidLoad(userId: Int) {
        let request = GetProductListRequest(userId: userId)
        getProductList.execute(request: request) {
            response in
            self.getProductListView?.load(product: response.products)
        } onFailure: { error in
            self.getProductListView?.failure(error: error.status)
        }
    }
    
    
}
