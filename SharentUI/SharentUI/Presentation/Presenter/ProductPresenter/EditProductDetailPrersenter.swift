//
//  EditProductDetailPrersenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation
import SharentBackendMacOS

class EditProductDetailPresenter: EditProductDetailPresenterContract {
  
    let editProductDetail: EditProductDetail
    weak var EditProductDetailView: EditProductDetailViewContract?
    weak var router: Router?
    
    init(editProductDetail: EditProductDetail) {
        self.editProductDetail = editProductDetail
    }
    
    func viewDidload(product: SharentBackendMacOS.Product) {
        let request = EditProductDetailRequest(product: product)
        editProductDetail.execute(request: request) { [weak self]
            response in
            self?.EditProductDetailView?.load(message: response)
        } onFailure: { error in
            
        }
    }
}
