//
//  ViewProductListDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation

public class GetProductListDataBaseService: GetProductListDataBaseContract {
    
    public init() {
        
    }
    
    
    public func getProductList(userId: Int, sucess: @escaping ([Product]) -> Void, failure: @escaping (Error) -> Void) {
    
        var productList = [Product]()
        let tableName = "product"
        let selectColumn = "product.productId,productName,price,productDetail,uploadedDate,sellerId,name,emailId,password,address,pincode,mobileNumber,catogery.catogeryId,catogeryName"
        
        let joinQuerry = "INNER JOIN user on user.userId = product.sellerId INNER JOIN catogery on catogery.catogeryId = product.catogeryId"
        let args = [userId]
        let whereQuerry = "sellerId = ?"
        let products = SelectQuerry.select(tableName: tableName,whereClause: whereQuerry,args: args, selectColumn: selectColumn,joinsQuerry: joinQuerry)
        if let products = products {
            
            for product in products {
                
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
                      let mobileNumber = product["mobileNumber"] as? String,
                      let pincode = product["pincode"] as? String,
                      let categoryId = product["catogeryId"] as? Int,
                      let categoryName = product["catogeryName"] as? String else { return }
                
                let category = Category(id: categoryId, name: categoryName)
                let seller = User(id: sellerId, name: sellerName, emailId: emailId, password: password, mobileNumber: mobileNumber, address: address, pincode: pincode)
                let product = Product(Id: productId, seller: seller, catogery: category, name: productName, price: price, detail: productDetail, uploadedDate: uploadedDate, status: .active)
                productList.append(product)
            }
            sucess(productList)
            return
        }
        failure(GetProductListError.GetProductListError.noProductFound)
    }
}
