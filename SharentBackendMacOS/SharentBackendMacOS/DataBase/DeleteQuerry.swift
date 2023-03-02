//
//  DeleteQuerry.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import SQLite3
import VTComponents

public class DeleteQuerry {
    
    public static func deleteQuerry(tableName: String, condition: String, response: (String) -> Void, error: (Error) -> Void) {
        
        let querry = "DELETE FROM \(tableName) WHERE \(condition)"
        
        let prepareStatement: OpaquePointer? = DataBase.shared.prepareStatement(query: querry)
        
        if sqlite3_step(prepareStatement) == SQLITE_DONE {
            response("Executed Sucessfully")
        }
        else {
            error(ZErrorType.unknownError)
        }
        
    }
}

