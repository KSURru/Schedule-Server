//
//  Worker.swift
//  Schedule-Server
//
//  Created by Nikita Arutyunov on 07.08.2018.
//

import Foundation

protocol ServerWorkerProtocol: class {
    
    var serializer: ServerSerializerProtocol { get }
    
    func constructSerializedWeek(with week: JSONGroup.JSONWeek) -> Data?
    
}


class ServerWorker: ServerWorkerProtocol {
    
    let serializer: ServerSerializerProtocol
    
    func constructSerializedWeek(with week: JSONGroup.JSONWeek) -> Data? {
        
        var serializedDays = [Data]()
        
        week.days.forEach { (day) in
            
            var serializedSections = [Data]()
            
            day.sections.forEach({ (section) in
                
                guard let serializedHeader = serializer.serializeHeader(title: section.header.title) else { return }
                
                var serializedLessons = [Data]()
                
                section.lessons.forEach({ (lesson) in
                    
                    guard let serializedLesson = serializer.serializeLesson(id: lesson.id, title: lesson.title, subtitle: lesson.subtitle, time: lesson.time, professor: lesson.professor, type: lesson.type) else { return }
                    
                    serializedLessons.append(serializedLesson)
                    
                })
                
                guard let serializedSection = serializer.serializeSection(id: section.id, serializedHeader: serializedHeader, serializedLessons: serializedLessons) else { return }
                
                serializedSections.append(serializedSection)
                
            })
            
            guard let serializedDay = serializer.serializeDay(id: day.id, title: day.title, serializedSections: serializedSections) else { return }
            
            serializedDays.append(serializedDay)
            
        }
        
        guard let serializedWeek = serializer.serializeWeek(even: week.even, serializedDays: serializedDays) else { return nil }
        
        return serializedWeek
        
    }
    
    init(serializer: ServerSerializerProtocol) {
        self.serializer = serializer
    }
    
}
