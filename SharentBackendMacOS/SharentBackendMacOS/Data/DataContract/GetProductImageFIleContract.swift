//
//  GetProductImageFIleContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 05/05/23.
//

import Foundation

public protocol GetProductImageFileContract {
    
    func getProductImageFile(products: [Product], callback: @escaping([Product]) -> Void)
    func getOrderProductImage(orders: [Order], callback: @escaping ([Order]) -> Void)
}
