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

public class JSONDecoder {
    public init() { }
}

extension JSONDecoder {
    public func decode<Model: Decodable>(
        _ type: Model.Type,
        from reader: StreamReader) throws -> Model
    {
        let decoder = try Decoder(reader)
        return try Model(from: decoder)
    }

    public func decode(
        decodable type: Decodable.Type,
        from reader: StreamReader) throws -> Decodable
    {
        let decoder = try Decoder(reader)
        return try type.init(from: decoder)
    }
}

class Decoder: Swift.Decoder {
    var codingPath: [CodingKey] {
        return []
    }
    var userInfo: [CodingUserInfoKey : Any] {
        return [:]
    }

    let json: JSON.Value

    init(_ json: JSON.Value) throws {
        self.json = json
    }

    init(_ stream: StreamReader) throws {
        self.json = try JSON.Value(from: stream)
    }

    func container<Key>(
        keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key>
    {
        guard case .object(let dictionary) = json else {
            throw DecodingError.typeMismatch([String : JSON.Value].self, nil)
        }
        let container = JSONKeyedDecodingContainer<Key>(dictionary)
        return KeyedDecodingContainer(container)
    }

    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        guard case .array(let array) = json else {
            throw DecodingError.typeMismatch([JSON.Value].self, nil)
        }
        return JSONUnkeyedDecodingContainer(array)
    }

    func singleValueContainer() throws -> SingleValueDecodingContainer {
        return JSONSingleValueDecodingContainer(json)
    }
}
