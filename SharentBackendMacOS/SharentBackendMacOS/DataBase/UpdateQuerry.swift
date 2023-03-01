//
//  UpdateQuerry.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 01/03/23.
//

import Foundation
import SQLite3
import VTComponents
class UpdateQuerry {
    
    static func insertQuerry(tableName: String, updateQuerry: String, condition: String, response: (String) -> Void, error: (Error) -> Void) {
        
        let querry = "UPDATE \(tableName) SET (\(updateQuerry)) WHERE (\(condition))"
        print(querry)
        let prepareStatement : OpaquePointer? = DataBase.shared.prepareStatement(query: querry)
        
        if sqlite3_step(prepareStatement) == SQLITE_DONE {
            response("Sucessfully Executed")
        }
        else {
            error(ZErrorType.unknownError)
        }
    }
}

