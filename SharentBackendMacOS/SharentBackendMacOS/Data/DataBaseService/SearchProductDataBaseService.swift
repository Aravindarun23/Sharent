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
    
    public func  SearchProduct(pincode: String, product: String, fromDate: String, toDate: String, success: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void) {
        
        var products = [Product]()
        
        let selectColumn = "product.productId,productName,price,productDetail,uploadedDate,sellerId,name,emailId,password,address,pincode,mobileNumber,catogery.catogeryId,catogeryName"
        
        let whereQuerry = "user.pincode = \(pincode) AND product.productName like \'%\(product)%\' AND((orders.pickUpDate < '\(fromDate)' AND  orders.pickUpDate < \'\(toDate)\') OR (orders.returnDate >  \'\(fromDate)\' AND orders.returnDate > \'\(toDate)\')) AND product.status = \'active\' AND orders.status != \'cancelled\' AND orders.status != \'success\'"
        
        let joinsQuerry = "INNER JOIN user on product.sellerId = user.userId INNER JOIN orders on product.productId = orders.productId INNER JOIN catogery on product.catogeryId = catogery.catogeryId"
        
        let result = SelectQuerry.select(tableName: "product", whereClause: whereQuerry, selectColumn: selectColumn, joinsQuerry: joinsQuerry)
        
        if result!.isEmpty {
            
            for product in result! {
                
                guard let productId = product["productId"] as? Int,
                      let productName = product["productName"] as? String,
                      let productDetail = product["productDetail"] as? String,
                      let price = product["price"] as? Int,
                      let uploadedDate = product["uploadedDate"] as? String,
                      let sellerId = product["sellerId"] as? Int,
                      let sellerName = product["name"] as? String,
                      let emailId = product["emailId"] as? String,
                      let password = product["password"] as? String,
                      let address = product["address"] as? String,
                      let mobileNumber = product["mobilerNumber"] as? String,
                      let pincode = product["pincode"] as? String,
                      let categoryId = product["catogeryId"] as? Int,
                      let categoryName = product["catogeryName"] as? String else { return }
                
                let category = Category(id: categoryId, name: categoryName)
                let seller = User(id: sellerId, name: sellerName, emailId: emailId, password: password, mobileNumber: mobileNumber, address: address, pincode: pincode)
                let product = Product(Id: productId, seller: seller, catogery: category, name: productName, price: price, detail: productDetail, uploadedDate: uploadedDate, status: .active)
                
                products.append(product)
            }
            success(products)
        }
        else {
            failure(ZErrorType.unknownError)
        }
        
        
        
    }
}
