//
//  Routes.swift
//  Serv
//
//  Created by Nikita Arutyunov on 06.08.2018.
//

import PerfectLib
import PerfectHTTP

protocol ServRoutesProtocol: class {
    
    var db: ServDatabaseProtocol { get }
    var worker: ServWorkerProtocol { get }
    var sender: ServSenderProtocol { get }
    
    var routes: Routes { get set }
    
    func get() -> Routes
    
}

class ServRoutes: ServRoutesProtocol {
    
    let db: ServDatabaseProtocol
    let worker: ServWorkerProtocol
    let sender: ServSenderProtocol
    
    var routes = Routes()
    
    init(database: ServDatabaseProtocol, worker: ServWorkerProtocol, sender: ServSenderProtocol) {
        
        self.db = database
        self.worker = worker
        self.sender = sender
        
        do {
            
            routes.add(method: .get, uri: "/v1/groups/{group_id}/weeks/{even}", handler: try getWeekHandler())
            
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func get() -> Routes {
        return routes
    }
    
}
