//
//  Handlers.swift
//  Schedule-Server
//
//  Created by Nikita Arutyunov on 06.08.2018.
//

import Foundation
import PerfectLib
import PerfectHTTP

protocol ServerHandlersProtocol: class {
    
    func getWeekHandler() throws -> RequestHandler
    
}

extension ServerRoutes: ServerHandlersProtocol {
    
    func getWeekHandler() throws -> RequestHandler {
        return {
            request, response in
            
            guard let groupId = request.urlVariables["group_id"] else { return }
            guard let evenString = request.urlVariables["even"] else { return }
            guard let even = Int(evenString) else { return }
            
            let collection = self.db.getCollection(name: "groups")

            guard let jsonResults = collection.find(by: "{ \"id\": \(groupId), \"week.even\": \(even) }") else {

                response.setBody(string: "\(even == 0 ? "Not": "") Even Week At Group \(groupId) Not Found")
                response.completed(status: HTTPResponseStatus.notFound)
                return

            }
            
            guard let jsonGroup = jsonResults.first! else { return }
            
            let group = try! JSONDecoder().decode(JSONGroup.self, from: jsonGroup.data(using: .utf8)!)
            
            guard let serializedWeek = self.worker.constructSerializedWeek(with: group.week) else { return }
            
            response.setHeader(.contentType, value: "application/octet-stream")
            response.setBody(bytes: [UInt8](serializedWeek))
            
            response.completed()
        }
    }
    
}
