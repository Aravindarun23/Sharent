//
//  SearchProductDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 06/03/23.
//

import Foundation
import VTComponents


public class SearchProductDataBaseService: SearchProductDataBaseContract {
    
    public init() {
        
    }
    
    public func SearchProduct(pincode: [String], product: String, filter: SearchProductRequest.Filter?, success: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void) {
        
        var products = [Product]()
        var orderBy = ""
        
        if let filter = filter {
            orderBy = filter.rawValue
        }
        let pincodeList = pincode.map { String($0) }.joined(separator: ", ")

        let selectColumn = "product.id AS productId,product.name AS productName,price,detail,uploadedDate,sellerId,user.name AS sellerName,emailId,password,address,pincode,mobileNumber,category.id AS categoryId,category.name as categoryName"
        
        let whereQuerry = "user.pincode in (\(pincodeList)) AND product.name like \'%\(product)%\' AND product.status = \'\(Product.Status.active.rawValue)\' ORDER BY \(orderBy)"
        
        let joinsQuerry = "INNER JOIN user on product.sellerId = user.id INNER JOIN category on product.categoryId = category.id"
        
        let result = SelectQuerry.select(tableName: "product", whereClause: whereQuerry, selectColumn: selectColumn, joinsQuerry: joinsQuerry)
        
        if let result = result {
            
            for product in result {
                
                guard let productId = product["productId"] as? Int,
                      let productName = product["productName"] as? String,
                      let productDetail = product["detail"] as? String,
                      let price = product["price"] as? Int,
                      let uploadedDate = product["uploadedDate"] as? String,
                      let sellerId = product["sellerId"] as? Int,
                      let sellerName = product["sellerName"] as? String,
                      let emailId = product["emailId"] as? String,
                      let password = product["password"] as? String,
                      let address = product["address"] as? String,
                      let mobileNumber = product["mobileNumber"] as? String,
                      let pincode = product["pincode"] as? String,
                      let categoryId = product["categoryId"] as? Int,
                      let categoryName = product["categoryName"] as? String else { return }
                
                let category = Category(id: categoryId, name: categoryName)
                let seller = User(id: sellerId, name: sellerName, emailId: emailId, password: password, mobileNumber: mobileNumber, address: address, pincode: pincode)
                let product = Product(id: productId, seller: seller, category: category, name: productName, price: price, detail: productDetail, uploadedDate: uploadedDate, status: .active)
                
                products.append(product)
            }
            success(products)
        }
        else {
            failure(SearchProductError.SearchProductError.noProductFound)
        }
    }

}

    
    
  
