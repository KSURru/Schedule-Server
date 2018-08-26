//
//  Worker.swift
//  Schedule-Server
//
//  Created by Nikita Arutyunov on 07.08.2018.
//

import Foundation

protocol ServerWorkerProtocol: class {
    
    var serializer: ServerSerializerProtocol { get }
    
    func constructSerializedLesson(with lesson: JSONLesson) -> Data?
    func constructSerializedHeader(with header: JSONHeader) -> Data?
    func constructSerializedSection(with section: JSONSection) -> Data?
    func constructSerializedDay(with day: JSONDay) -> Data?
    func constructSerializedWeek(with week: JSONWeek) -> Data?
    func constructSerializedGroup(with group: JSONGroup) -> Data?
    
}


class ServerWorker: ServerWorkerProtocol {
    
    let serializer: ServerSerializerProtocol
    
    func constructSerializedLesson(with lesson: JSONLesson) -> Data? {
        
        guard let serializedLesson = serializer.serializeLesson(id: lesson.id, title: lesson.title, subtitle: lesson.subtitle, time: lesson.time, professor: lesson.professor, type: lesson.type) else { return nil }
        
        return serializedLesson
        
    }
    
    func constructSerializedHeader(with header: JSONHeader) -> Data? {
        
        guard let serializedHeader = serializer.serializeHeader(title: header.title) else { return nil }
        
        return serializedHeader
        
    }
    
    func constructSerializedSection(with section: JSONSection) -> Data? {
        
        guard let serializedHeader = constructSerializedHeader(with: section.header) else { return nil }
        
        var serializedLessons = [Data]()
        
        section.lessons.forEach({ (lesson) in
            
            guard let serializedLesson = constructSerializedLesson(with: lesson) else { return }
            
            serializedLessons.append(serializedLesson)
            
        })
        
        guard let serializedSection = serializer.serializeSection(id: section.id, serializedHeader: serializedHeader, serializedLessons: serializedLessons) else { return nil }
        
        return serializedSection
        
    }
    
    func constructSerializedDay(with day: JSONDay) -> Data? {
        
        var serializedSections = [Data]()
        
        day.sections.forEach({ (section) in
            
            guard let serializedSection = constructSerializedSection(with: section) else { return }
            
            serializedSections.append(serializedSection)
            
        })
        
        guard let serializedDay = serializer.serializeDay(id: day.id, title: day.title, serializedSections: serializedSections) else { return nil }
        
        return serializedDay
        
    }
    
    func constructSerializedWeek(with week: JSONWeek) -> Data? {
        
        var serializedDays = [Data]()
        
        week.days.forEach { (day) in
            
            guard let serializedDay = constructSerializedDay(with: day) else { return }
            
            serializedDays.append(serializedDay)
            
        }
        
        guard let serializedWeek = serializer.serializeWeek(id: week.id, even: week.even, serializedDays: serializedDays) else { return nil }
        
        return serializedWeek
        
    }
    
    func constructSerializedGroup(with group: JSONGroup) -> Data? {
        
        var serializedWeeks = [Data]()
        
        group.weeks.forEach { (week) in
            
            guard let serializedWeek = constructSerializedWeek(with: week) else { return }
            
            serializedWeeks.append(serializedWeek)
            
        }
        
        guard let serializedGroup = serializer.serializeGroup(id: group.id, title: group.title, serializedWeeks: serializedWeeks) else { return nil }
        
        return serializedGroup
        
    }
    
    init(serializer: ServerSerializerProtocol) {
        self.serializer = serializer
    }
    
}
