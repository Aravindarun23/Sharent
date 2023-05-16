//
//  SelectQuerry.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 27/02/23.
//

import Foundation
import SQLite3

class SelectQuerry {
    
    static func select(tableName: String, whereClause: String? = nil, args: [Any]? = nil, selectColumn: String = "*", joinsQuerry: String = "") -> [[String: Any]]? {
        
        var results: [[String: Any]]?
        let query = "SELECT \(selectColumn) FROM \(tableName) \(joinsQuerry) \(whereClause != nil ? "WHERE \(whereClause!)" : "")"
        
        if let prepare = DataBase.shared.prepareStatement(query: query) {
            if let args = args {
                for i in 0..<args.count {
                    if let value = args[i] as? String {
                        sqlite3_bind_text(prepare, Int32(i + 1), (value as NSString).utf8String, -1, nil)
                    } else if let value = args[i] as? Int {
                        sqlite3_bind_int(prepare, Int32(i + 1), Int32(value))
                    } else if let value = args[i] as? Double {
                        sqlite3_bind_double(prepare, Int32(i + 1), value)
                    } else if args[i] is NSNull {
                        sqlite3_bind_null(prepare, Int32(i + 1))
                    } else {
                        sqlite3_finalize(prepare)
                        return nil
                    }
                    
                }
            }
            
            
            var rows = [[String: Any]]()
            
            
            while sqlite3_step(prepare) == SQLITE_ROW {
                var row = [String: Any]()
                for i in 0..<sqlite3_column_count(prepare) {
                    let name = String(cString: sqlite3_column_name(prepare, i))
                    let type = sqlite3_column_type(prepare, i)
                    let value: Any?
                    switch type {
                    case SQLITE_INTEGER:
                        value = Int(sqlite3_column_int(prepare, i))
                    case SQLITE_FLOAT:
                        value = Double(sqlite3_column_double(prepare, i))
                    case SQLITE_TEXT:
                        let cString = sqlite3_column_text(prepare, i)
                        value = String(cString: cString!)
                    case SQLITE_BLOB:
                        let data = sqlite3_column_blob(prepare, i)
                        let size = Int(sqlite3_column_bytes(prepare, i))
                        value = Data(bytes: data!, count: size)
                    case SQLITE_NULL:
                        value = nil
                    default:
                        // Unsupported type
                        sqlite3_finalize(prepare)
                        return nil
                    }
                    row[name] = value
                }
                rows.append(row)
            }
            if rows.isEmpty {
                return nil
            }
            results = rows
        }
        return results
    }
}

