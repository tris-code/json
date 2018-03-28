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

class UnkeyedDecodingContainerTests: TestCase {
    func testContainer() {
        scope {
            let decoder = try Decoder(InputByteStream("[1,2]"))
            var unkeyedContainer = try decoder.unkeyedContainer()
            assertEqual(unkeyedContainer.count, 2)
            assertEqual(unkeyedContainer.isAtEnd, false)

            let int1 = try unkeyedContainer.decode(Int.self)
            let int2 = try unkeyedContainer.decode(Int.self)
            assertEqual(unkeyedContainer.isAtEnd, true)
            assertEqual(int1, 1)
            assertEqual(int2, 2)
        }
    }

    func testNestedContainer() {
        scope {
            let decoder = try Decoder(InputByteStream("[[1],[2]]"))
            var unkeyedContainer = try decoder.unkeyedContainer()
            assertEqual(unkeyedContainer.count, 2)
            assertEqual(unkeyedContainer.isAtEnd, false)

            var nested1 = try unkeyedContainer.nestedUnkeyedContainer()
            assertEqual(nested1.count, 1)
            assertEqual(nested1.isAtEnd, false)
            let int1 = try nested1.decode(Int.self)
            assertEqual(int1, 1)
            assertEqual(nested1.isAtEnd, true)

            var nested2 = try unkeyedContainer.nestedUnkeyedContainer()
            assertEqual(nested2.count, 1)
            assertEqual(nested2.isAtEnd, false)
            let int2 = try nested2.decode(Int.self)
            assertEqual(int2, 2)
            assertEqual(nested2.isAtEnd, true)

            assertEqual(unkeyedContainer.isAtEnd, true)
        }
    }
}
