//
//  DataBase.swift
//  SharentBackendMacOS
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation
import SQLite3


public class DataBase {
    
    var dbPointer: OpaquePointer?
    
    static let shared =  DataBase()
    
    private init()
    {
        createDatabase()
        createUserTable()
        catogeryTable()
        productTable()
        adminTable()
    }
    
    private func createDatabase() {
        
        var filePath: String = ""
        
        do {
            var path = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            path.append(path: "RentalApp.sqlite")
            filePath  = path.absoluteString
        } catch {
            print("Error creating directory!")
        }
        
        var tempDbPointer: OpaquePointer?

        if sqlite3_open(filePath, &tempDbPointer) == SQLITE_OK {
            if let dbPoint = tempDbPointer {
                dbPointer = dbPoint
            }
        }
        else {
            print("Error in Database Creation")
        }
    }
    
    private func createTable(querry: String) {
        
        let createTableStatement = prepareStatement(query: querry)
        if sqlite3_step(createTableStatement) == SQLITE_DONE {
            return
        }
        else {
            print("Error In Table Creation")
        }
    }
   
    
    public func prepareStatement(query: String) -> OpaquePointer? {

        var statementPointer: OpaquePointer?
        if sqlite3_prepare(dbPointer, query, -1, &statementPointer, nil) == SQLITE_OK {
            return statementPointer
        } else {
            print("Error In Prepare Statement")
        }
        return nil
    }
    
    

    private func createUserTable() {
        
        let userTableQuerry = """
        CREATE TABLE IF NOT EXISTS "user" (
            "userId"    INTEGER,
            "name"    TEXT,
            "emailId"    TEXT,
            "password"    TEXT,
            "mobileNumber"    TEXT,
            "address"    TEXT,
            "pincode"    TEXT,
            PRIMARY KEY("userId" AUTOINCREMENT)
        )
        """
        createTable(querry: userTableQuerry)
    }
    
    private func catogeryTable() {
        
        let catogeryTableQuerry = """
        CREATE TABLE IF NOT EXISTS "catogery" (
            "catogeryId"    INTEGER,
            "catogeryName"    TEXT,
            PRIMARY KEY("catogeryId" AUTOINCREMENT)
        )
        """
        createTable(querry: catogeryTableQuerry)
        
    }
    
    private func productTable() {
        
        let productTableQuerry = """
            CREATE TABLE  IF NOT EXISTS "product" (
            "productId"    INTEGER,
            "catogeryId"    INTEGER,
            "sellerId"    INTEGER,
            "productName"    TEXT,
            "price"    INTEGER,
            "productDetail"    TEXT,
            "uploadedDate"    TEXT,
            "status"    TEXT,
            PRIMARY KEY("productId" AUTOINCREMENT),
            FOREIGN KEY("catogeryId") REFERENCES "catogery"("catogeryId"),
            FOREIGN KEY("sellerId") REFERENCES "user"("userId")
        )
        """
        createTable(querry: productTableQuerry)
    }
    
    private func adminTable() {
        
        let adminTableQuerry = """
            CREATE TABLE IF NOT EXISTS "admin" (
            "id"    INTEGER,
            "emailId"    TEXT,
            "password"    TEXT,
            PRIMARY KEY("id" AUTOINCREMENT)
        )
        """
    }
    
}
