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
            guard let even = Bool(evenString) else { return }
            
            let collection = self.db.getCollection(name: "groups")

            guard let jsonResults = collection.find(by: "{ \"id\": \(groupId) }") else {

                response.setBody(string: "\(!even ? "Not": "") Even Week At Group \(groupId) Not Found")
                response.completed(status: HTTPResponseStatus.notFound)
                
                return

            }
            
            if jsonResults.count == 0 {
                
                response.setBody(string: "\(!even ? "Odd" : "Even") Week At Group \(groupId) Not Found")
                response.completed(status: HTTPResponseStatus.notFound)
                
                return
            }
            
            guard let jsonGroup = jsonResults[0] else { return }
                
            let group = try! JSONDecoder().decode(JSONGroup.self, from: jsonGroup.data(using: .utf8)!)
            
            guard let week = group.weeks.first(where: { $0.even == even }) else { return }
            
            guard let serializedWeek = self.worker.constructSerializedWeek(with: week) else { return }
            
            response.setHeader(.contentType, value: "application/octet-stream")
            response.setBody(bytes: [UInt8](serializedWeek))
            
//            let enc = JSONEncoder()
//
//            let jsonWeek = try! enc.encode(week)
//
//            response.setHeader(.contentType, value: "text/json")
//            response.setBody(string: String(data: jsonWeek, encoding: .utf8)!)

            response.completed()
            
        }
    }
    
    func getGroupHandler() throws -> RequestHandler {
        return {
            request, response in
            
            guard let groupId = request.urlVariables["group_id"] else { return }
            
            let collection = self.db.getCollection(name: "groups")
            
            guard let jsonResults = collection.find(by: "{ \"id\": \(groupId) }") else {
                
                response.setBody(string: "Group \(groupId) Not Found")
                response.completed(status: HTTPResponseStatus.notFound)
                
                return
                
            }
            
            if jsonResults.count == 0 {
                
                response.setBody(string: "Group \(groupId) Not Found")
                response.completed(status: HTTPResponseStatus.notFound)
                
                return
            }
            
            guard let jsonGroup = jsonResults[0] else { return }
            
            let group = try! JSONDecoder().decode(JSONGroup.self, from: jsonGroup.data(using: .utf8)!)
            
            guard let serializedGroup = self.worker.constructSerializedGroup(with: group) else { return }
            
            response.setHeader(.contentType, value: "application/octet-stream")
            response.setBody(bytes: [UInt8](serializedGroup))
            
            response.completed()
            
        }
    }
    
}
