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

class UnkeyedEncodingContainerTests: TestCase {
    func testUnkeyedContainer() {
        do {
            let expected = "[1,2]"
            let encoder = _JSONEncoder()
            var unkeyedContainer = encoder.unkeyedContainer()
            try unkeyedContainer.encode(1)
            try unkeyedContainer.encode(2)
            assertEqual(encoder.json, expected)
        } catch {
            fail(String(describing: error))
        }
    }

    func testNestedUnkeyedContainer() {
        do {
            let expected = "[[1],[2]]"
            let encoder = _JSONEncoder()
            var unkeyedContainer = encoder.unkeyedContainer()
            var nested1 = unkeyedContainer.nestedUnkeyedContainer()
            try nested1.encode(1)
            var nested2 = unkeyedContainer.nestedUnkeyedContainer()
            try nested2.encode(2)
            assertEqual(encoder.json, expected)
        } catch {
            fail(String(describing: error))
        }
    }


    static var allTests = [
        ("testUnkeyedContainer", testUnkeyedContainer),
        ("testNestedUnkeyedContainer", testNestedUnkeyedContainer),
    ]
}
