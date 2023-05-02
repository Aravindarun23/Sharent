//
//  InsertQuerry.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 22/02/23.
//

import Foundation
import SQLite3
import VTComponents

class InsertQuerry {
    
    static func insertQuerry(tableName: String, columnName: String, insertData: String, response: (String) -> Void, error: (Error) -> Void) {
        
        let querry = "INSERT INTO \(tableName) (\(columnName)) VALUES (\(insertData))"
        
        let prepareStatement : OpaquePointer? = DataBase.shared.prepareStatement(query: querry)
        
        if sqlite3_step(prepareStatement) == SQLITE_DONE {
            response("Sucessfully Executed")
        }
        else {
            error(ZErrorType.unknownError)
        }
    }
}
