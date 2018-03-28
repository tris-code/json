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

class UnkeyedEncodingContainerTests: TestCase {
    func testContainer() {
        scope {
            let output = OutputByteStream()
            let encoder = _JSONEncoder(output)
            var unkeyedContainer = encoder.unkeyedContainer()
            try unkeyedContainer.encode(1)
            try unkeyedContainer.encode(2)
            try encoder.close()
            assertEqual(output.string, "[1,2]")
        }
    }

    func testNestedContainer() {
        scope {
            let output = OutputByteStream()
            let encoder = _JSONEncoder(output)
            var unkeyedContainer = encoder.unkeyedContainer()
            var nested1 = unkeyedContainer.nestedUnkeyedContainer()
            try nested1.encode(1)
            var nested2 = unkeyedContainer.nestedUnkeyedContainer()
            try nested2.encode(2)
            try encoder.close()
            assertEqual(output.string, "[[1],[2]]")
        }
    }

    func testNull() {
        scope {
            let output = OutputByteStream()
            let encoder = _JSONEncoder(output)
            var unkeyedContainer = encoder.unkeyedContainer()
            try unkeyedContainer.encodeNil()
            try unkeyedContainer.encodeNil()
            try encoder.close()
            assertEqual(output.string, "[null,null]")
        }
    }
}
