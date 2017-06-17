/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension Dictionary where Key == String, Value == JSONValue {
    init(
        from json: String.UnicodeScalarView,
        at index: inout String.UnicodeScalarView.Index
    ) throws {
        guard json[index] == "{" else {
            throw JSONError.invalidJSON
        }
        json.formIndex(after: &index)

        var done = false
        var result = [String : JSONValue]()
        while !done, index < json.endIndex {
            json.formIndex(from: &index, consuming: .whitespace)
            switch json[index] {
            case "}":
                json.formIndex(after: &index)
                done = true
            case "\"":
                let key = try String(from: json, at: &index)
                json.formIndex(from: &index, consuming: .whitespace)
                guard json[index] == ":" else {
                    throw JSONError.invalidJSON
                }
                json.formIndex(after: &index)
                json.formIndex(from: &index, consuming: .whitespace)
                result[key] = try JSONValue(from: json, at: &index)
            case ",":
                json.formIndex(after: &index)
            default:
                throw JSONError.invalidJSON
            }
        }

        self = result
    }
}
