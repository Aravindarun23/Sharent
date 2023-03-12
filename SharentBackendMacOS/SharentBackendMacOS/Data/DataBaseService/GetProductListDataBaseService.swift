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
        let selectColumn = "product.id AS productId,product.name AS productName,price,detail,uploadedDate,sellerId,user.name AS sellerName,emailId,password,address,pincode,mobileNumber,category.id AS categoryId,category.name as categoryName"
        
        let joinQuerry = "INNER JOIN user on user.id = product.sellerId INNER JOIN category on category.id = product.categoryId"
        let args = [userId]
        let whereQuerry = "sellerId = ? ORDER BY product.uploadedDate DESC"
        let products = SelectQuerry.select(tableName: tableName,whereClause: whereQuerry,args: args, selectColumn: selectColumn,joinsQuerry: joinQuerry)
        if let products = products {
            
            for product in products {
                
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
                productList.append(product)
            }
            sucess(productList)
            return
        }
        failure(GetProductListError.GetProductListError.noProductFound)
    }
}
