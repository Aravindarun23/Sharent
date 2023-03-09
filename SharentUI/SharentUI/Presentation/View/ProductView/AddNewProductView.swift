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
        let catogery = Category(id: 1, name: "bikes")
        let user = User(id: 1, name: "aravind", emailId: "arvind123", password: "a123", mobileNumber: "1212323", address: "coimbatore", pincode: "614601")
        let product = Product(Id: 0, seller: user, catogery: catogery, name: "laptop", price: 1223, uploadedDate: "12/01/23", status: .inactive)
        addNewProductPresenter.viewDidload(product: product)
        
    }
    
}

extension AddNewProductView: AddNewProductViewContract {
    
    func load(message: AddNewProductResponse) {
        print(message.responseMsg)
    }
}
