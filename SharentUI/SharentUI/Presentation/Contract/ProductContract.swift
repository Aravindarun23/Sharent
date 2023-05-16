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
    func load(message: String)
}

protocol EditProductDetailViewContract: AnyObject {
    func load(message: String)
}

protocol EditProductDetailPresenterContract: AnyObject {
    func viewDidload(product: Product)
}

protocol DeleteProductPresenterContract: AnyObject {
    func viewDidload(productId: Int)
}
protocol DeleteProductViewContract: AnyObject {
    func load(message: String)
}

protocol SearchProductPresenterContract: AnyObject {
    func viewDidLoad(productName: String, pincode: String, filter: SearchProductRequest.Filter?, range: Int?)
}
protocol ProductListViewContract: AnyObject {
    func load(products: [Product])
    func failure(error: Error)
}

protocol GetProductListViewContract: AnyObject {
    func load(product: [Product])
    func failure(error: Error)
}

protocol GetProductListPresenterContract: AnyObject {
    func viewDidLoad(userId: Int)
}

protocol GetProductBookedDateViewContract: AnyObject {
    func load(dateList: [String])
}

protocol GetProductBookedDatePresenterContract: AnyObject {
    func viewDidLoad(productId: Int)
}
