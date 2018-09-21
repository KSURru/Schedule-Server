//
//  Routes.swift
//  Schedule-Server
//
//  Created by Nikita Arutyunov on 06.08.2018.
//

import PerfectLib
import PerfectHTTP

protocol ServerRoutesProtocol: class {
    
    var db: ServerDatabaseProtocol { get }
    var worker: ServerWorkerProtocol { get }
    
    var routes: Routes { get set }
    
    func get() -> Routes
    
}

class ServerRoutes: ServerRoutesProtocol {
    
    let db: ServerDatabaseProtocol
    let worker: ServerWorkerProtocol
    
    var routes = Routes()
    
    init(database: ServerDatabaseProtocol, worker: ServerWorkerProtocol) {
        
        self.db = database
        self.worker = worker
        
        do {
            
            routes.add(method: .get, uri: "/v1/groups/{group_id}/weeks/{even}", handler: try getWeekHandler())
            routes.add(method: .get, uri: "/v1/groups/{group_id}", handler: try getGroupHandler())
            routes.add(method: .get, uri: "/v1/even", handler: try getEvenHandler())
            
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func get() -> Routes {
        return routes
    }
    
}
