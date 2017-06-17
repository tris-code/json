/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Test
@testable import JSON

class _JSONEncoderTests: TestCase {
    func testKeyedContainer() {
        let expected = """
            {"answer":42}
            """
        let encoder = _JSONEncoder()
        enum Keys: CodingKey {
            case answer
        }
        var container = encoder.container(keyedBy: Keys.self)
        try? container.encode(42, forKey: .answer)
        assertEqual(encoder.json, expected)
    }

    func testUnkeyedContainer() {
        let expected = "[1,[2],[3],4]"
        let encoder = _JSONEncoder()
        var container = encoder.unkeyedContainer()
        try? container.encode(1)
        var nested1 = container.nestedUnkeyedContainer()
        try? nested1.encode(2)
        var nested2 = container.nestedUnkeyedContainer()
        try? nested2.encode(3)
        try? container.encode(4)
        assertEqual(encoder.json, expected)
    }

    func testSingleValueContainer() {
        let expected = "true"
        let encoder = _JSONEncoder()
        var container = encoder.singleValueContainer()
        try? container.encode(true)
        assertEqual(encoder.json, expected)
    }


    static var allTests = [
        ("testKeyedContainer", testKeyedContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
        ("testSingleValueContainer", testSingleValueContainer)
    ]
}
