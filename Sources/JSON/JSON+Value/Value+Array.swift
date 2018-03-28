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

extension Array where Element == JSON.Value {
    public init(from stream: StreamReader) throws {
        guard try stream.consume(.bracketOpen) else {
            throw JSON.Error.invalidJSON
        }
        var result = [JSON.Value]()
        loop: while true {
            try stream.consume(set: .whitespaces)

            switch try stream.peek() {
            case .bracketClose:
                try stream.consume(count: 1)
                break loop
            case .comma:
                try stream.consume(count: 1)
            default:
                result.append(try JSON.Value(from: stream))
            }
        }
        self = result
    }
}
