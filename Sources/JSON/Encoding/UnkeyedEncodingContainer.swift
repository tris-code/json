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

struct JSONUnkeyedEncodingContainer: UnkeyedEncodingContainer {
    var codingPath: [CodingKey] {
        return []
    }

    let encoder: Encoder
    let nestingLevel: Int
    var count: Int

    init(_ encoder: Encoder) {
        self.encoder = encoder
        self.nestingLevel = encoder.openedContainers.count
        self.count = 0
    }

    var hasValues = false
    mutating func writeCommaIfNeeded() throws {
        guard _slowPath(hasValues) else {
            hasValues = true
            return
        }
        try encoder.storage.write(",")
    }

    var hasNested = false
    mutating func closeNestedIfNeeded() throws {
        if hasNested {
            try encoder.closeContainers(downTo: nestingLevel)
            hasNested = false
        }
    }

    mutating func encodeNil() throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encodeNil()
        count += 1
    }

    mutating func encode(_ value: Bool) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: Int) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: Int8) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: Int16) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: Int32) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: Int64) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: UInt) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: UInt8) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: UInt16) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: UInt32) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: UInt64) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: Float) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: Double) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode(_ value: String) throws {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        try encoder.encode(value)
        count += 1
    }

    mutating func encode<T>(_ value: T) throws where T : Encodable {
        try closeNestedIfNeeded()
        try writeCommaIfNeeded()
        hasNested = true
        try value.encode(to: encoder)
        count += 1
    }

    mutating func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type
    ) -> KeyedEncodingContainer<NestedKey> {
        do {
            try closeNestedIfNeeded()
            try writeCommaIfNeeded()
            hasNested = true
            count += 1
            return encoder.container(keyedBy: keyType)
        } catch {
            let container = KeyedEncodingContainerError<NestedKey>()
            return KeyedEncodingContainer(container)
        }
    }

    mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        do {
            try closeNestedIfNeeded()
            try writeCommaIfNeeded()
            hasNested = true
            count += 1
            return encoder.unkeyedContainer()
        } catch {
            return UnkeyedEncodingContainerError()
        }
    }

    mutating func superEncoder() -> Swift.Encoder {
        do {
            try closeNestedIfNeeded()
            try writeCommaIfNeeded()
            hasNested = true
            return encoder
        } catch {
            return EncoderError()
        }
    }
}
