//
//  Serializer.swift
//  Serv
//
//  Created by Nikita Arutyunov on 06.08.2018.
//

import Foundation
import SwiftProtobuf

protocol ServSerializerProtocol: class {
    
    func serializeLesson(id: Int32, title: String, subtitle: String, time: String, professor: String, type: String) -> Data?
    func serializeHeader(title: String) -> Data?
    func serializeSection(id: Int32, serializedHeader: Data, serializedLessons: [Data]) -> Data?
    func serializeDay(id: Int32, title: String, serializedSections: [Data]) -> Data?
    func serializeWeek(even: Int32, serializedDays: [Data]) -> Data?
    
}

class ServSerializer: ServSerializerProtocol {
    
    func serializeLesson(id: Int32, title: String, subtitle: String, time: String, professor: String, type: String) -> Data? {
        
        var lesson = Week.Day.Section.Lesson()
        
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
        
        var header = Week.Day.Section.Header()
        
        header.title = title
        
        do {
            return try header.serializedData()
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func serializeSection(id: Int32, serializedHeader: Data, serializedLessons: [Data]) -> Data? {
        
        var section = Week.Day.Section()
        
        let header = try! Week.Day.Section.Header(serializedData: serializedHeader)
        var lessons = [Week.Day.Section.Lesson]()
        
        serializedLessons.forEach { (serializedLesson) in
            lessons.append(try! Week.Day.Section.Lesson(serializedData: serializedLesson))
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
        
        var day = Week.Day()
        
        var sections = [Week.Day.Section]()
        
        serializedSections.forEach { (serializedSection) in
            sections.append(try! Week.Day.Section(serializedData: serializedSection))
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
    
    func serializeWeek(even: Int32, serializedDays: [Data]) -> Data? {
        
        var week = Week()
        
        var days = [Week.Day]()
        
        serializedDays.forEach { (serializedDay) in
            days.append(try! Week.Day(serializedData: serializedDay))
        }
        
        week.even = even
        week.days = days
        
        do {
            return try week.serializedData()
        } catch {
            fatalError("\(error)")
        }
        
    }
    
}
