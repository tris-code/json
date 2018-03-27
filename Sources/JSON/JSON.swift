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

public struct JSON {
    public static func encode<Model: Encodable, Writer: StreamWriter>(
        _ value: Model,
        to stream: Writer) throws
    {
        let encoder = JSONEncoder()
        try encoder.encode(value, to: stream)
    }

    public static func decode<Model: Decodable, Reader: StreamReader>(
        _ type: Model.Type,
        from stream: Reader) throws -> Model
    {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: stream)
    }
}

extension JSON {
    public static func encode<T: Encodable>(_ value: T) throws -> [UInt8] {
        let encoder = JSONEncoder()
        return try encoder.encode(value)
    }

    public static func decode<T: Decodable>(
        _ type: T.Type,
        from json: [UInt8]) throws -> T
    {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: InputByteStream(json))
    }
}
