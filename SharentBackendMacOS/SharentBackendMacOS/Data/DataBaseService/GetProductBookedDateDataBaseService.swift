//
//  GetProductBookedDateDataBaseService.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation
import VTComponents

public class GetProductBookedDataBaseService: GetProductBookedDateDataBaseContract {
    
    public init() {
        
    }
    var BookedDays: [String] = []
    
    public func getProductBookedDate(productId: Int, success: @escaping ([String]) -> Void, failure: @escaping (Error) -> Void) {
        
        let status = Order.Status.confirmed.rawValue
        let selectQuerry = "pickUpDate,returnDate"
        let tableName = "orders"
        let whereQuerry = "productId = ? AND status = \'\(status)\'"
        let args: [Any] = [productId, status]
        let result = SelectQuerry.select(tableName: tableName, whereClause: whereQuerry, args: args, selectColumn: selectQuerry)
        
        if let dateList = result {
            for list in dateList {
                findDates(fromDate: list["pickUpDate"] as! String, toDate: list["returnDate"] as! String)
            }
            success(BookedDays)
        }
        else {
            success(BookedDays)
        }
    }
    
    
    private func findDates(fromDate: String, toDate: String) {
 
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormatter.date(from: fromDate)!
        let endDate = dateFormatter.date(from: toDate)!

        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        let numberOfDays = components.day!
        if numberOfDays >= 0 {
            var currentDate = startDate
           
            while currentDate <= endDate {
                BookedDays.append(dateFormatter.string(from: currentDate))
                currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
            }
        }
    }

}
