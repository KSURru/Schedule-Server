//
//  Configurator.swift
//  Schedule-Server
//
//  Created by Nikita Arutyunov on 06.08.2018.
//

import Foundation

protocol ServerConfiguratorProtocol: class {
    
    var dbUri: String { get }
    var dbName: String { get }
    
    var servName: String { get }
    var servAddress: String { get }
    var servPort: Int { get }
    
    var routes: ServerRoutesProtocol { get }
    var launcher: ServerLauncherProtocol { get }
    var database: ServerDatabaseProtocol { get }
    var serializer: ServerSerializerProtocol { get }
    var worker: ServerWorkerProtocol { get }
    
}

class ServerConfigurator: ServerConfiguratorProtocol {
    
    let dbUri = "mongodb://127.0.0.1:27017"
    let dbName = "test"
    
    let servName = "localhost"
    let servAddress = "0.0.0.0"
    let servPort = 8081
    
    
    let routes: ServerRoutesProtocol
    let launcher: ServerLauncherProtocol
    let database: ServerDatabaseProtocol
    let serializer: ServerSerializerProtocol
    let worker: ServerWorkerProtocol
    
    init() {
        
        database = ServerDatabase(uri: dbUri, db: dbName)
        serializer = ServerSerializer()
        worker = ServerWorker(serializer: serializer)
        
        routes = ServerRoutes(database: database, worker: worker)
        launcher = ServerLauncher(name: servName, address: servAddress, port: servPort, routes: routes.get())
        
        launcher.launch()
        
    }
    
}
