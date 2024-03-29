//
//  FileManager.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 05/05/23.
//

import Foundation
import VTComponents


public class File {
    
    public init() {
        
    }
    
    public func getProductImageFile(products: [Product]) -> [Product]{
        
        var product: Product
        var productList: [Product] = []
        for data in products {
            product = data
            getFileUrlImage(productId: product.id) { fileUrl in
                product.image = fileUrl
            }
            productList.append(product)
        }
        return productList
    }
    
    public func getOrdersProductImage(orders: [Order]) -> [Order]{
        var product: Product
        var orderList: [Order] = []
        for data in orders {
            product = data.product
            getFileUrlImage(productId: product.id) { fileUrl in
                product.image = fileUrl
            }
            orderList.append(Order(id: data.id, buyer: data.buyer, product: product, orderedDate: data.orderedDate, fromDate: data.fromDate, returnDate: data.returnDate, status: data.status))
        }
        return orderList
    }
    
    private func getFileUrlImage(productId: Int, callback: @escaping ([String]?) -> Void) {
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let folderURL = documentsURL.appendingPathComponent("Products/" + String(productId) )
        var fileUrl = [String]()
        do {
            let fileNameList = try fileManager.contentsOfDirectory(atPath: folderURL.path)
            for fileName in fileNameList {
                fileUrl.append(String(folderURL.path) + "/" + fileName)
            }
            if fileUrl.isEmpty {
                callback(nil)
                return
            }
            callback(fileUrl)
        }
        catch {
            print("Error while enumerating files \(folderURL.path): \(error.localizedDescription)")
        }
        
    }
}
