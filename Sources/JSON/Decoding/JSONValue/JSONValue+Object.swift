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

extension Dictionary where Key == String, Value == JSONValue {
    init<T: StreamReader>(from stream: T) throws {
        guard try stream.consume(.curlyBracketOpen) else {
            throw JSONError.invalidJSON
        }

        var result = [String : JSONValue]()
        loop: while true {
            try stream.consume(set: .whitespace)

            switch try stream.peek() {
            case .curlyBracketClose:
                try stream.consume(count: 1)
                break loop
            case .quote:
                let key = try String(from: stream)
                try stream.consume(set: .whitespace)
                guard try stream.consume(.colon) else {
                    throw JSONError.invalidJSON
                }
                try stream.consume(set: .whitespace)
                result[key] = try JSONValue(from: stream)
            case .comma:
                try stream.consume(count: 1)
            default:
                throw JSONError.invalidJSON
            }
        }
        self = result
    }
}
