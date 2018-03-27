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
import Stream
@testable import JSON

class _JSONEncoderTests: TestCase {
    func testKeyedContainer() {
        let expected = [UInt8]("""
            {"answer":42}
            """.utf8)
        let output = OutputByteStream()
        let encoder = _JSONEncoder(output)
        enum Keys: CodingKey {
            case answer
        }
        var container = encoder.container(keyedBy: Keys.self)
        try? container.encode(42, forKey: .answer)
        try? encoder.closeContainers(downTo: 0)
        assertEqual(output.bytes, expected)
    }

    func testUnkeyedContainer() {
        let expected = [UInt8]("[1,[2],[3],4]".utf8)
        let output = OutputByteStream()
        let encoder = _JSONEncoder(output)
        var container = encoder.unkeyedContainer()
        try? container.encode(1)
        var nested1 = container.nestedUnkeyedContainer()
        try? nested1.encode(2)
        var nested2 = container.nestedUnkeyedContainer()
        try? nested2.encode(3)
        try? container.encode(4)
        try? encoder.closeContainers(downTo: 0)
        assertEqual(output.bytes, expected)
    }

    func testSingleValueContainer() {
        let expected = [UInt8]("true".utf8)
        let output = OutputByteStream()
        let encoder = _JSONEncoder(output)
        var container = encoder.singleValueContainer()
        try? container.encode(true)
        assertEqual(output.bytes, expected)
    }


    static var allTests = [
        ("testKeyedContainer", testKeyedContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
        ("testSingleValueContainer", testSingleValueContainer)
    ]
}
