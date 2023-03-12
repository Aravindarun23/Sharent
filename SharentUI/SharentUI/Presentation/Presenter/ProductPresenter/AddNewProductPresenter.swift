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
    
    
    func viewDidload(product: Product) {
        let request = AddNewProductRequest(product: product)
        addNewProduct.execute(request: request) {
            response in
            self.addNewProductView?.load(message: response.responseMsg)
            
        } onFailure: { error in

        }
    }
}
