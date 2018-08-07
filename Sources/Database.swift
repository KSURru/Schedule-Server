//
//  Database.swift
//  Serv
//
//  Created by Nikita Arutyunov on 06.08.2018.
//

import PerfectMongoDB

protocol ServDatabaseProtocol: class {
    
    var client: MongoClient { get }
    var db: MongoDatabase { get }
    
    func getCollection(name: String) -> MongoCollection
    
}

class ServDatabase: ServDatabaseProtocol {
    
    let client: MongoClient
    let db: MongoDatabase
    
    init(uri: String, db name: String) {
        
        client = try! MongoClient(uri: uri)
        db = client.getDatabase(name: name)
        
    }
    
    func getCollection(name: String) -> MongoCollection {
        
        guard let collection = db.getCollection(name: name) else {
            fatalError("Collection `\(name)` Not Found")
        }
        
        return collection
        
    }
    
}

extension MongoCollection {
    func find(by: String) -> String? {
        
        var arr = [String]()
        
        do {
            let fnd = self.find(query: try BSON(json: by))
            
            for x in fnd! {
                arr.append(x.asString)
            }
            
        } catch {
            fatalError("\(error)")
        }
        
        return arr.first
        
    }
}
