/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Stream

struct JSONSingleValueEncodingContainer<Writer: StreamWriter>
: SingleValueEncodingContainer {
    var codingPath: [CodingKey] {
        return []
    }

    let encoder: _JSONEncoder<Writer>

    init(_ encoder: _JSONEncoder<Writer>) {
        self.encoder = encoder
    }

    mutating func encodeNil() throws {
        try encoder.encodeNil()
    }

    mutating func encode(_ value: Bool) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: Int) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: Int8) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: Int16) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: Int32) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: Int64) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: UInt) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: UInt8) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: UInt16) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: UInt32) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: UInt64) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: Float) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: Double) throws {
        try encoder.encode(value)
    }

    mutating func encode(_ value: String) throws {
        try encoder.encode(value)
    }

    mutating func encode<T>(_ value: T) throws where T : Encodable {
        try value.encode(to: encoder)
    }
}
