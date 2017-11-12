/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension Array where Element == JSONValue {
    init(
        from json: [UInt8],
        at index: inout Int
    ) throws {
        guard json[index] == .bracketOpen else {
            throw JSONError.invalidJSON
        }
        json.formIndex(after: &index)

        var done = false
        var result = [JSONValue]()
        while !done, index < json.endIndex {
            json.formIndex(from: &index, consuming: .whitespace)
            switch json[index] {
            case .bracketClose:
                json.formIndex(after: &index)
                done = true
            case .comma:
                json.formIndex(after: &index)
            default:
                result.append(try JSONValue(from: json, at: &index))
            }
        }

        self = result
    }
}
