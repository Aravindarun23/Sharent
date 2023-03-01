//
//  AddNewProductPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation
import SharentBackendMacOS


class AddNewProductPresenter: AddNewProductPresenterContract {
   
    
    
    let addNewProduct: AddNewProduct
    weak var addNewProductView: AddNewProductViewContract?
    weak var router: Router?
    
    init(addNewProduct: AddNewProduct) {
        self.addNewProduct = addNewProduct
    }
    
    
    func viewDidload(product: SharentBackendMacOS.Product) {
        let request = AddNewProductRequest(product: product)
        addNewProduct.execute(request: request) {
            responseMsg in
            self.addNewProductView?.load(message: responseMsg)
            
        } onFailure: { error in

        }
    }
    
}
