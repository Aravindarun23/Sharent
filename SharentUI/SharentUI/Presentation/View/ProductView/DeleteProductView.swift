//
//  DeleteProductView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class DeleteProductView: NSView {
    
    let deleteProductPresenter: DeleteProductPresenterContract
    
    init(deleteProductPresenter: DeleteProductPresenterContract) {
        self.deleteProductPresenter = deleteProductPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        deleteProductPresenter.viewDidload(productId: 3)
    }
    
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DeleteProductView: DeleteProductViewContract  {
    
    func load(message: DeleteProductResponse) {
        print(message.responseMessage)
    }
}
