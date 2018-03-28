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

extension Dictionary where Key == String, Value == JSON.Value {
    public init<T: StreamReader>(from stream: T) throws {
        guard try stream.consume(.curlyBracketOpen) else {
            throw JSON.Error.invalidJSON
        }

        var result = [String : JSON.Value]()
        loop: while true {
            try stream.consume(set: .whitespaces)

            switch try stream.peek() {
            case .curlyBracketClose:
                try stream.consume(count: 1)
                break loop
            case .quote:
                let key = try String(from: stream)
                try stream.consume(set: .whitespaces)
                guard try stream.consume(.colon) else {
                    throw JSON.Error.invalidJSON
                }
                try stream.consume(set: .whitespaces)
                result[key] = try JSON.Value(from: stream)
            case .comma:
                try stream.consume(count: 1)
            default:
                throw JSON.Error.invalidJSON
            }
        }
        self = result
    }
}
