//
//  Configurator.swift
//  Serv
//
//  Created by Nikita Arutyunov on 06.08.2018.
//

import Foundation

protocol ServConfiguratorProtocol: class {
    
    var dbUri: String { get }
    var dbName: String { get }
    
    var servName: String { get }
    var servAddress: String { get }
    var servPort: Int { get }
    
    var routes: ServRoutesProtocol { get }
    var launcher: ServLauncherProtocol { get }
    var database: ServDatabaseProtocol { get }
    var serializer: ServSerializerProtocol { get }
    var sender: ServSenderProtocol { get }
    var worker: ServWorkerProtocol { get }
    
}

class ServConfigurator: ServConfiguratorProtocol {
    
    let dbUri = "mongodb://127.0.0.1:27017"
    let dbName = "test"
    
    let servName = "localhost"
    let servAddress = "0.0.0.0"
    let servPort = 8081
    
    
    let routes: ServRoutesProtocol
    let launcher: ServLauncherProtocol
    let database: ServDatabaseProtocol
    let serializer: ServSerializerProtocol
    let sender: ServSenderProtocol
    let worker: ServWorkerProtocol
    
    init() {
        
        database = ServDatabase(uri: dbUri, db: dbName)
        serializer = ServSerializer()
        sender = ServSender()
        worker = ServWorker(serializer: serializer)
        
        routes = ServRoutes(database: database, worker: worker, sender: sender)
        launcher = ServLauncher(name: servName, address: servAddress, port: servPort, routes: routes.get())
        
        launcher.launch()
        
    }
    
}
