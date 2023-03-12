//
//  EditProductDetailView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS


class EditProductDetailView: NSView {
    
    let EditProductDetailPresenter: EditProductDetailPresenterContract
    
    init(EditProductDetailPresenter: EditProductDetailPresenterContract) {
        self.EditProductDetailPresenter = EditProductDetailPresenter
        super.init(frame: NSRect())
        
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            
            let user = User(id: 2, name: "arun", emailId: "arvind123", password: "a123", mobileNumber: "123456", address: "pkt", pincode: "614602")
            let category = Category(id: 1, name: "bike")
            let product = Product(Id: 1, seller: user, category: category, name: "helicopter", price: 2345, uploadedDate: "23/01/2023", status: .active)
            EditProductDetailPresenter.viewDidload(product: product)
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EditProductDetailView: EditProductDetailViewContract {
    func load(message: String) {
        print(message)
    }
    
    
}
