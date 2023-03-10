//
//  GetMyOrderListDataBaseContract.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation

public class GetOrderListDataBaseService: GetOrderListDataBaseContract {
    
    public init() {
        
    }
    public func getOrderList(buyerId: Int?, sellerId: Int?, success: @escaping ([Order]) -> Void, failure: @escaping (Error) -> Void) {
        
        let tableName = "orders"
        var orders = [Order]()
        
        let selectQuerry = "seller.name AS sellerName,seller.id AS sellerId,seller.emailId AS sellerEmail,seller.password AS sellerPassword,seller.address AS sellerAddress,seller.pincode AS sellerPincode,seller.mobileNumber AS sellerMobileNumber,buyer.name AS buyerName,buyer.id AS buyerId,buyer.emailId AS buyerEmail,buyer.password AS buyerPassword,buyer.address AS buyerAddress,buyer.pincode AS buyerPincode,buyer.mobileNumber AS buyerMobileNumber,category.name AS categoryName,category.id AS categoryId,orders.id,orderDate,pickUpDate,returnDate,uploadedDate,products.name AS productName,detail,price,orders.productId, products.status AS productStatus,orders.status AS orderStatus"
        
        let joins = "INNER JOIN user AS buyer ON orders.buyerId = buyer.id INNER JOIN product AS products ON orders.productId = products.id INNER JOIN category ON products.categoryId = category.id INNER JOIN user AS seller ON products.sellerId = seller.id"
        
        if let buyerId = buyerId {
            
            let whereQuerry = "buyerId = ? ORDER BY orders.orderDate DESC"
            let args = [buyerId]
            
            let result = SelectQuerry.select(tableName: tableName,whereClause: whereQuerry,args: args,selectColumn: selectQuerry, joinsQuerry: joins)
            
            if let result = result  {
                for order in result {
                    let order = getOrder(order: order)
                    orders.append(order!)
                }
                success(orders)
            }
            else {
                failure(GetOrderListError.orderListError.noOrderFound)
            }
        }
        
        if let sellerId = sellerId {
            
            let whereQuerry = "products.sellerId = ?"
            let args = [sellerId]
            
            let result = SelectQuerry.select(tableName: tableName,whereClause: whereQuerry,args: args,selectColumn: selectQuerry, joinsQuerry: joins)
            if let result = result {
                for order in result {
                    let order = getOrder(order: order)
                    orders.append(order!)
                }
                success(orders)
            }
            else {
                failure(GetOrderListError.orderListError.noOrderFound)
            }
        }
        
        if sellerId == nil && buyerId == nil {
            let result = SelectQuerry.select(tableName: tableName,selectColumn: selectQuerry, joinsQuerry: joins)
            
                if let result = result {
                    for order in result {
                        let order = getOrder(order: order)
                        orders.append(order!)
                    }
                    success(orders)
                }
                else {
                    failure(GetOrderListError.orderListError.noOrderFound)
                }
        }
    }
    // MARK: convert to order entity
    
    private func getOrder(order: [String: Any]) -> Order? {

        guard let productId = order["productId"] as? Int,
              let productName = order["productName"] as? String,
              let productDetail = order["detail"] as? String,
              let productStatus = order["productStatus"] as? String,
              let orderedDate = order["orderDate"] as? String,
              let price = order["price"] as? Int,
              let uploadedDate = order["uploadedDate"] as? String,
              let sellerId = order["sellerId"] as? Int,
              let sellerName = order["sellerName"] as? String,
              let sellerEmailId = order["sellerEmail"] as? String,
              let sellerPassword = order["sellerPassword"] as? String,
              let sellerAddress = order["sellerAddress"] as? String,
              let sellerMobileNumber = order["sellerMobileNumber"] as? String,
              let sellerPincode = order["sellerPincode"] as? String,
              let buyerId = order["buyerId"] as? Int,
              let buyerName = order["buyerName"] as? String,
              let buyerEmailId = order["buyerEmail"] as? String,
              let buyerPassword = order["buyerPassword"] as? String,
              let buyerAddress = order["buyerAddress"] as? String,
              let buyerMobileNumber = order["buyerMobileNumber"] as? String,
              let buyerPincode = order["buyerPincode"] as? String,
              let categoryId = order["categoryId"] as? Int,
              let categoryName = order["categoryName"] as? String,
              let orderId = order["id"] as? Int,
              let pickUpDate = order["pickUpDate"] as? String,
              let returnDate = order["returnDate"] as? String,
              let orderStatus = order["orderStatus"] as? String
        else {
        return nil }

        let orderState = Order.Status(rawValue: orderStatus)
        let productState = Product.Status(rawValue: productStatus)

        let seller = User(id: sellerId, name: sellerName, emailId: sellerEmailId, password: sellerPassword, mobileNumber: sellerMobileNumber, address: sellerAddress, pincode: sellerPincode)
        let buyer =  User(id: buyerId, name: buyerName, emailId: buyerEmailId, password: buyerPassword, mobileNumber: buyerMobileNumber, address: buyerAddress, pincode: buyerPincode)
        let category = Category(id: categoryId, name: categoryName)
        let product = Product(id: productId, seller: seller, category: category, name: productName, price: price, detail: productDetail, uploadedDate: uploadedDate, status: productState!)
        let order = Order(id: orderId, buyer: buyer, product: product, orderedDate: orderedDate, fromDate: pickUpDate, returnDate: returnDate, status: orderState!)
        return order
    }
}
