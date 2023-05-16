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
        orderTable()
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
            "id"    INTEGER,
            "name"    TEXT,
            "emailId"    TEXT,
            "password"    TEXT,
            "mobileNumber"    TEXT,
            "address"    TEXT,
            "pincode"    TEXT,
            PRIMARY KEY("id" AUTOINCREMENT)
        )
        """
        createTable(querry: userTableQuerry)
    }
    
    private func catogeryTable() {
        let catogeryTableQuerry = """
        CREATE TABLE IF NOT EXISTS "category" (
            "id"    INTEGER,
            "name"    TEXT,
            PRIMARY KEY("id" AUTOINCREMENT)
        )
        """
        createTable(querry: catogeryTableQuerry)
    }
    
    
    private func productTable() {
        
        let productTableQuerry = """
            CREATE TABLE  IF NOT EXISTS "product" (
            "id"    INTEGER,
            "categoryId"    INTEGER,
            "sellerId"    INTEGER,
            "name"    TEXT,
            "price"    INTEGER,
            "detail"    TEXT,
            "uploadedDate"  DATETIME NOT NULL,
            "status"    TEXT,
            PRIMARY KEY("id" AUTOINCREMENT),
            FOREIGN KEY("categoryId") REFERENCES "category"("id"),
            FOREIGN KEY("sellerId") REFERENCES "user"("id")
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
        createTable(querry: adminTableQuerry)
    }
    
    private func orderTable() {
        
        let orderTableQuerry = """
       
        CREATE TABLE IF NOT EXISTS "orders" (
            "id"    INTEGER NOT NULL,
            "productId"    INTEGER,
            "buyerId"    INTEGER,
            "orderDate"    DATETIME NOT NULL,
            "pickUpDate"   DATETIME NOT NULL,
            "returnDate"   DATETIME NOT NULL,
            "totalPrice"    INTEGER NOT NULL,
            "status"    TEXT NOT NULL,
            PRIMARY KEY("id" AUTOINCREMENT),
            FOREIGN KEY("productId") REFERENCES "product"("id"),
            FOREIGN KEY("buyerId") REFERENCES "user"("id")
        )
       """
        
        createTable(querry: orderTableQuerry)
    }
    
}
