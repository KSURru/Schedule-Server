//
//  Launcher.swift
//  Schedule-Server
//
//  Created by Nikita Arutyunov on 06.08.2018.
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

protocol ServerLauncherProtocol: class {
    
    var server: HTTPServer.Server { get }
    
    func launch()
    
}

class ServerLauncher: ServerLauncherProtocol {
    
    let server: HTTPServer.Server
    
    init(name: String, address: String, port: Int, routes: Routes) {
        server = .init(name: name, address: address, port: port, routes: routes)
    }
    
    func launch() {
        do { try HTTPServer.launch(server) } catch { fatalError("\(error)") }
    }
    
}
