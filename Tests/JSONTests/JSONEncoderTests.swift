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

class JSONEncoderTests: TestCase {
    func testKeyed() {
        let expected = [UInt8]("""
            {"answer":42,"hello":"Hello, World"}
            """.utf8)
        struct Model: Encodable {
            let answer: Int = 42
            let hello: String = "Hello, World"
        }
        do {
            let json = try JSONEncoder().encode(Model())
            assertEqual(json, expected)
        } catch {
            fail(String(describing: error))
        }
    }

    func testKeyedNested() {
        let expected = [UInt8]("""
            {"answer":42,"nested":{"hello":"Hello, World"}}
            """.utf8)
        struct Model: Encodable {
            struct Nested: Encodable {
                let hello = "Hello, World"
            }
            let answer: Int = 42
            let nested = Nested()
        }
        do {
            let json = try JSONEncoder().encode(Model())
            assertEqual(json, expected)
        } catch {
            fail(String(describing: error))
        }
    }

    func testKeyedInTheMiddle() {
        let expected = [UInt8]("""
            {"nested":{"hello":"Hello, World"},"answer":42}
            """.utf8)
        struct Model: Encodable {
            struct Nested: Encodable {
                let hello = "Hello, World"
            }
            let nested = Nested()
            let answer: Int = 42
        }
        do {
            let json = try JSONEncoder().encode(Model())
            assertEqual(json, expected)
        } catch {
            fail(String(describing: error))
        }
    }

    func testNestedInTheMiddle() {
        let expected = [UInt8]("""
            {"nested":{"array":[1,2]},"answer":42}
            """.utf8)
        struct Model: Encodable {
            struct Nested: Encodable {
                let array: [Int] = [1,2]
            }
            let nested = Nested()
            let answer: Int = 42
        }
        do {
            let json = try JSONEncoder().encode(Model())
            assertEqual(json, expected)
        } catch {
            fail(String(describing: error))
        }
    }

    func testNestedArrayInTheMiddle() {
        let expected = [UInt8]("""
            {"nested":{"array":[[1,2],[3,4]]},"answer":42}
            """.utf8)
        struct Model: Encodable {
            struct Nested: Encodable {
                let array: [[Int]] = [[1,2],[3,4]]
            }
            let nested = Nested()
            let answer: Int = 42
        }
        do {
            let json = try JSONEncoder().encode(Model())
            assertEqual(json, expected)
        } catch {
            fail(String(describing: error))
        }
    }

    func testEncodeUnkeyed() {
        do {
            let expected = [UInt8]("[1,2,3]".utf8)
            let json = try JSONEncoder().encode([1,2,3])
            assertEqual(json, expected)
        } catch {
            fail(String(describing: error))
        }
    }

    func testEncodeUnkeyedOfUnkeyed() {
        do {
            let expected = [UInt8]("[[1,2],[3,4]]".utf8)
            let json = try JSONEncoder().encode([[1,2],[3,4]])
            assertEqual(json, expected)
        } catch {
            fail(String(describing: error))
        }
    }

    func testEnum() {
        let expected = [UInt8]("""
            {"single":1,"array":[1,2,3]}
            """.utf8)
        enum Number: Int, Encodable {
            case one = 1
            case two
            case three
        }
        struct Model: Encodable {
            let single: Number = .one
            let array: [Number] = [.one, .two, .three]
        }
        do {
            let json = try JSONEncoder().encode(Model())
            assertEqual(json, expected)
        } catch {
            fail(String(describing: error))
        }
    }
    
    func testEncodable() {
        let expected = [UInt8]("""
            {"answer":42,"hello":"Hello, World"}
            """.utf8)
        struct Model: Encodable {
            let answer: Int = 42
            let hello: String = "Hello, World"
        }
        let encodable = Model() as Encodable
        do {
            let json = try JSONEncoder().encode(encodable)
            assertEqual(json, expected)
        } catch {
            fail(String(describing: error))
        }
    }
}
