//
//  AddProductView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class AddNewProductView: NSView {
    
    let addNewProductPresenter: AddNewProductPresenterContract
    init(addNewProductPresenter: AddNewProductPresenterContract) {
        self.addNewProductPresenter = addNewProductPresenter
        super.init(frame: NSRect())
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
         addProduct()
    }
    
    func addProduct() {
        let category = Category(id: 1, name: "bike")
        let user = User(id: 1, name: "aravind", emailId: "arvind123", password: "a123", mobileNumber: "1212323", address: "coimbatore", pincode: "614601")
        let product = Product(id: 0, seller: user, category: category, name: "laptop", price: 10000, uploadedDate: "2023/01/23", status: .active)
        addNewProductPresenter.viewDidload(product: product)
        
    }
    
}

extension AddNewProductView: AddNewProductViewContract {
    
    func load(message: String) {
        print(message)
    }
}
