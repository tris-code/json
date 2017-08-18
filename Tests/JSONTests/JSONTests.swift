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

class JSONTests: TestCase {
    func testEncode() {
        let expected = """
            {"answer":42,"hello":"Hello, World!"}
            """
        struct Model: Encodable {
            let answer: Int = 42
            let hello: String = "Hello, World!"
        }
        let json = try? JSON.encode(Model())
        assertEqual(json, expected)
    }

    func testDecode() {
        let json = """
            {"answer":42,"hello":"Hello, World!"}
            """
        struct Model: Decodable {
            let answer: Int
            let hello: String
        }
        let model = try? JSON.decode(Model.self, from: json)
        assertEqual(model?.answer, 42)
        assertEqual(model?.hello, "Hello, World!")
    }

    func testDecodeEscaped() {
        let json = """
            {
              "answer":42,
              "hello":"Hello, World!"
            }
            """
        struct Model: Decodable {
            let answer: Int
            let hello: String
        }
        let model = try? JSON.decode(Model.self, from: json)
        assertEqual(model?.answer, 42)
        assertEqual(model?.hello, "Hello, World!")
    }

    func testDecodeEscapedUnicode() {
        let json = """
            {
              "answer":42,
              "hello":"\\u3053\\u3093\\u306b\\u3061\\u306f"
            }
            """
        struct Model: Decodable {
            let answer: Int
            let hello: String
        }
        let model = try? JSON.decode(Model.self, from: json)
        assertEqual(model?.answer, 42)
        assertEqual(model?.hello, "こんにちは")
    }


    static var allTests = [
        ("testEncode", testEncode),
        ("testDecode", testDecode),
        ("testDecodeEscaped", testDecodeEscaped),
        ("testDecodeEscapedUnicode", testDecodeEscapedUnicode),
    ]
}
