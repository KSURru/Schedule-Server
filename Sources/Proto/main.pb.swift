// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: main.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct ProtoLesson {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Int32 = 0

  var title: String = String()

  var subtitle: String = String()

  var time: String = String()

  var professor: String = String()

  var type: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct ProtoHeader {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var title: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct ProtoSection {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Int32 {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  var header: ProtoHeader {
    get {return _storage._header ?? ProtoHeader()}
    set {_uniqueStorage()._header = newValue}
  }
  /// Returns true if `header` has been explicitly set.
  var hasHeader: Bool {return _storage._header != nil}
  /// Clears the value of `header`. Subsequent reads from it will return its default value.
  mutating func clearHeader() {_storage._header = nil}

  var lessons: [ProtoLesson] {
    get {return _storage._lessons}
    set {_uniqueStorage()._lessons = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct ProtoDay {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Int32 = 0

  var title: String = String()

  var sections: [ProtoSection] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct ProtoWeek {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Int32 = 0

  var even: Bool = false

  var days: [ProtoDay] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct ProtoGroup {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Int32 = 0

  var title: String = String()

  var weeks: [ProtoWeek] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension ProtoLesson: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ProtoLesson"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "title"),
    3: .same(proto: "subtitle"),
    4: .same(proto: "time"),
    5: .same(proto: "professor"),
    6: .same(proto: "type"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.title)
      case 3: try decoder.decodeSingularStringField(value: &self.subtitle)
      case 4: try decoder.decodeSingularStringField(value: &self.time)
      case 5: try decoder.decodeSingularStringField(value: &self.professor)
      case 6: try decoder.decodeSingularStringField(value: &self.type)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularInt32Field(value: self.id, fieldNumber: 1)
    }
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 2)
    }
    if !self.subtitle.isEmpty {
      try visitor.visitSingularStringField(value: self.subtitle, fieldNumber: 3)
    }
    if !self.time.isEmpty {
      try visitor.visitSingularStringField(value: self.time, fieldNumber: 4)
    }
    if !self.professor.isEmpty {
      try visitor.visitSingularStringField(value: self.professor, fieldNumber: 5)
    }
    if !self.type.isEmpty {
      try visitor.visitSingularStringField(value: self.type, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: ProtoLesson) -> Bool {
    if self.id != other.id {return false}
    if self.title != other.title {return false}
    if self.subtitle != other.subtitle {return false}
    if self.time != other.time {return false}
    if self.professor != other.professor {return false}
    if self.type != other.type {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension ProtoHeader: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ProtoHeader"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.title)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: ProtoHeader) -> Bool {
    if self.title != other.title {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension ProtoSection: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ProtoSection"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "header"),
    3: .same(proto: "lessons"),
  ]

  fileprivate class _StorageClass {
    var _id: Int32 = 0
    var _header: ProtoHeader? = nil
    var _lessons: [ProtoLesson] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _header = source._header
      _lessons = source._lessons
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularInt32Field(value: &_storage._id)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._header)
        case 3: try decoder.decodeRepeatedMessageField(value: &_storage._lessons)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._id != 0 {
        try visitor.visitSingularInt32Field(value: _storage._id, fieldNumber: 1)
      }
      if let v = _storage._header {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if !_storage._lessons.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._lessons, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: ProtoSection) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._id != other_storage._id {return false}
        if _storage._header != other_storage._header {return false}
        if _storage._lessons != other_storage._lessons {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension ProtoDay: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ProtoDay"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "title"),
    3: .same(proto: "sections"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.title)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.sections)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularInt32Field(value: self.id, fieldNumber: 1)
    }
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 2)
    }
    if !self.sections.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.sections, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: ProtoDay) -> Bool {
    if self.id != other.id {return false}
    if self.title != other.title {return false}
    if self.sections != other.sections {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension ProtoWeek: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ProtoWeek"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "even"),
    3: .same(proto: "days"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.id)
      case 2: try decoder.decodeSingularBoolField(value: &self.even)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.days)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularInt32Field(value: self.id, fieldNumber: 1)
    }
    if self.even != false {
      try visitor.visitSingularBoolField(value: self.even, fieldNumber: 2)
    }
    if !self.days.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.days, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: ProtoWeek) -> Bool {
    if self.id != other.id {return false}
    if self.even != other.even {return false}
    if self.days != other.days {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension ProtoGroup: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ProtoGroup"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "title"),
    3: .same(proto: "weeks"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.title)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.weeks)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularInt32Field(value: self.id, fieldNumber: 1)
    }
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 2)
    }
    if !self.weeks.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.weeks, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: ProtoGroup) -> Bool {
    if self.id != other.id {return false}
    if self.title != other.title {return false}
    if self.weeks != other.weeks {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
