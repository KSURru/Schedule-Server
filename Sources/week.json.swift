//
//  week.JSON.swift
//  Schedule-Server
//
//  Created by Nikita Arutyunov on 07.08.2018.
//

import Foundation

struct JSONLesson: Codable {
    
    let id: Int32
    let title: String
    let subtitle: String
    let time: String
    let professor: String
    let type: String
    
}

struct JSONHeader: Codable {
    
    let title: String
    
}

struct JSONSection: Codable {
    
    let id: Int32
    let header: JSONHeader
    let lessons: [JSONLesson]
    
}

struct JSONDay: Codable {
    
    let id: Int32
    let title: String
    let sections: [JSONSection]
    
}

struct JSONWeek: Codable {
    
    let id: Int32
    let even: Bool
    let days: [JSONDay]
    
}

struct JSONGroup: Codable {
    
    let id: Int32
    let title: String
    let weeks: [JSONWeek]
    
}
