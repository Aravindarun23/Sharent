//
//  ProductContract.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import SharentBackendMacOS



protocol AddNewProductPresenterContract: AnyObject {
    func viewDidload(product: Product)
}
protocol AddNewProductViewContract: AnyObject {
    func load(message: AddNewProductResponse)
}

protocol EditProductDetailViewContract: AnyObject {
    func load(message: EditProductDetailResponse)
}

protocol EditProductDetailPresenterContract: AnyObject {
    func viewDidload(product: Product)
}

protocol DeleteProductPresenterContract: AnyObject {
    func viewDidload(productId: Int)
}
protocol DeleteProductViewContract: AnyObject {
    func load(message: DeleteProductResponse)
}

protocol SearchProductPresenterContract: AnyObject {
    func viewDidLoad(productName: String, pincode: String, fromDate: String, toDate: String)
}
protocol SearchProductViewContract: AnyObject {
    func load(products: [Product])
    func failure(error: Error)
}
