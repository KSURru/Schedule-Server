//
//  Serializer.swift
//  Schedule-Server
//
//  Created by Nikita Arutyunov on 06.08.2018.
//

import Foundation
import SwiftProtobuf

protocol ServerSerializerProtocol: class {
    
    func serializeLesson(id: Int32, title: String, subtitle: String, time: String, professor: String, type: String) -> Data?
    func serializeHeader(title: String) -> Data?
    func serializeSection(id: Int32, serializedHeader: Data, serializedLessons: [Data]) -> Data?
    func serializeDay(id: Int32, title: String, serializedSections: [Data]) -> Data?
    func serializeWeek(id: Int32, even: Bool, serializedDays: [Data]) -> Data?
    func serializeGroup(id: Int32, title: String, serializedWeeks: [Data]) -> Data?
    
}

class ServerSerializer: ServerSerializerProtocol {
    
    func serializeLesson(id: Int32, title: String, subtitle: String, time: String, professor: String, type: String) -> Data? {
        
        var lesson = ProtoLesson()
        
        lesson.id = id
        lesson.title = title
        lesson.subtitle = subtitle
        lesson.time = time
        lesson.professor = professor
        lesson.type = type
        
        do {
            return try lesson.serializedData()
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func serializeHeader(title: String) -> Data? {
        
        var header = ProtoHeader()
        
        header.title = title
        
        do {
            return try header.serializedData()
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func serializeSection(id: Int32, serializedHeader: Data, serializedLessons: [Data]) -> Data? {
        
        var section = ProtoSection()
        
        let header = try! ProtoHeader(serializedData: serializedHeader)
        var lessons = [ProtoLesson]()
        
        serializedLessons.forEach { (serializedLesson) in
            lessons.append(try! ProtoLesson(serializedData: serializedLesson))
        }
        
        section.id = id
        section.header = header
        section.lessons = lessons
        
        do {
            return try section.serializedData()
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func serializeDay(id: Int32, title: String, serializedSections: [Data]) -> Data? {
        
        var day = ProtoDay()
        
        var sections = [ProtoSection]()
        
        serializedSections.forEach { (serializedSection) in
            sections.append(try! ProtoSection(serializedData: serializedSection))
        }
        
        day.id = id
        day.title = title
        day.sections = sections
        
        do {
            return try day.serializedData()
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func serializeWeek(id: Int32, even: Bool, serializedDays: [Data]) -> Data? {
        
        var week = ProtoWeek()
        
        var days = [ProtoDay]()
        
        serializedDays.forEach { (serializedDay) in
            days.append(try! ProtoDay(serializedData: serializedDay))
        }
        
        week.id = id
        week.even = even
        week.days = days
        
        do {
            return try week.serializedData()
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func serializeGroup(id: Int32, title: String, serializedWeeks: [Data]) -> Data? {
        
        var group = ProtoGroup()
        
        var weeks = [ProtoWeek]()
        
        serializedWeeks.forEach { (serializedWeek) in
            weeks.append(try! ProtoWeek(serializedData: serializedWeek))
        }
        
        group.id = id
        group.title = title
        group.weeks = weeks
        
        do {
            return try group.serializedData()
        } catch {
            fatalError("\(error)")
        }
        
    }
    
}
