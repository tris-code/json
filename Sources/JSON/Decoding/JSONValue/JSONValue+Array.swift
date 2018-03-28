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

extension Array where Element == JSONValue {
    public init<T: StreamReader>(from stream: T) throws {
        guard try stream.consume(.bracketOpen) else {
            throw JSONError.invalidJSON
        }
        var result = [JSONValue]()
        loop: while true {
            try stream.consume(set: .whitespaces)

            switch try stream.peek() {
            case .bracketClose:
                try stream.consume(count: 1)
                break loop
            case .comma:
                try stream.consume(count: 1)
            default:
                result.append(try JSONValue(from: stream))
            }
        }
        self = result
    }
}
