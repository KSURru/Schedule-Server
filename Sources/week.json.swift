//
//  week.JSON.swift
//  Schedule-Server
//
//  Created by Nikita Arutyunov on 07.08.2018.
//

import Foundation

struct JSONGroup: Codable {
    
    struct JSONWeek: Codable {
        
        struct JSONDay: Codable {
            
            struct JSONSection: Codable {
                
                struct JSONHeader: Codable {
                    
                    let title: String
                    
                }
                
                struct JSONLesson: Codable {
                    
                    let id: Int32
                    let title: String
                    let subtitle: String
                    let time: String
                    let professor: String
                    let type: String
                    
                }
                
                let id: Int32
                let header: JSONHeader
                let lessons: [JSONLesson]
                
            }
            
            let id: Int32
            let title: String
            let sections: [JSONSection]
            
        }
        
        let even: Int32
        let days: [JSONDay]
        
    }
    
    let id: Int32
    let title: String
    let week: JSONWeek
    
}
