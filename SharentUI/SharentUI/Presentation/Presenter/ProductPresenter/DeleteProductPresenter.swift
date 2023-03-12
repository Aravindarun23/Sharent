//
//  DeleteProductPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import SharentBackendMacOS


class DeleteProductPresenter: DeleteProductPresenterContract {
    
    let deleteProduct: DeleteProduct
    weak var deleteProductView: DeleteProductViewContract?
    weak var router: Router?
    
    init(deleteProduct: DeleteProduct) {
        self.deleteProduct = deleteProduct
    }
    
    func viewDidload(productId: Int) {
        let request = DeleteProductRequest(productId: productId)
        deleteProduct.execute(request: request) {
            response in
            self.deleteProductView?.load(message: response.responseMessage)
        } onFailure: { error in
            
        }
    }
    
    
    
    
    
}
