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

struct EncoderError: Encoder {
    var codingPath: [CodingKey] { return [] }

    var userInfo: [CodingUserInfoKey : Any] { return [:] }

    func container<Key: CodingKey>(
        keyedBy type: Key.Type) -> KeyedEncodingContainer<Key>
    {
        return KeyedEncodingContainer(KeyedEncodingContainerError())
    }

    func unkeyedContainer() -> UnkeyedEncodingContainer {
        return UnkeyedEncodingContainerError()
    }

    func singleValueContainer() -> SingleValueEncodingContainer {
        return SingleValueEncodingContainerError()
    }
}

struct SingleValueEncodingContainerError: SingleValueEncodingContainer {
    var codingPath: [CodingKey] { return [] }

    mutating func encodeNil() throws {
        throw StreamError.notEnoughSpace
    }

    mutating func encode<T>(_ value: T) throws where T : Encodable {
        throw StreamError.notEnoughSpace
    }
}

struct UnkeyedEncodingContainerError: UnkeyedEncodingContainer {
    var codingPath: [CodingKey] {
        return []
    }

    var count: Int {
        return 0
    }

    mutating func encodeNil() throws {
        throw StreamError.notEnoughSpace
    }

    mutating func encode<T>(_ value: T) throws where T : Encodable {
        throw StreamError.notEnoughSpace
    }

    mutating func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey>
    {
        return KeyedEncodingContainer(KeyedEncodingContainerError<NestedKey>())
    }

    mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        return UnkeyedEncodingContainerError()
    }

    mutating func superEncoder() -> Encoder {
        return EncoderError()
    }
}

struct KeyedEncodingContainerError<K : CodingKey>
: KeyedEncodingContainerProtocol {
    typealias Key = K

    var codingPath: [CodingKey] { return [] }

    mutating func encodeNil(forKey key: K) throws {
        throw StreamError.notEnoughSpace
    }

    mutating func encode<T: Encodable>(_ value: T, forKey key: K) throws {
        throw StreamError.notEnoughSpace
    }

    mutating func nestedContainer<NestedKey: CodingKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: K) -> KeyedEncodingContainer<NestedKey>
    {
        return KeyedEncodingContainer(KeyedEncodingContainerError<NestedKey>())
    }

    mutating func nestedUnkeyedContainer(
        forKey key: K) -> UnkeyedEncodingContainer
    {
        return UnkeyedEncodingContainerError()
    }

    mutating func superEncoder() -> Encoder {
        return EncoderError()
    }

    mutating func superEncoder(forKey key: K) -> Encoder {
        return EncoderError()
    }
}
