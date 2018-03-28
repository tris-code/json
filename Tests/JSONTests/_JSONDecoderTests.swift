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

class _JSONDecoderTests: TestCase {
    func testKeyedContainer() {
        scope {
            let json = InputByteStream("""
                {"answer":42}
                """)
            let decoder = try _JSONDecoder(json)
            enum Keys: CodingKey {
                case answer
            }
            let container = try decoder.container(keyedBy: Keys.self)
            let answer = try container.decode(Int.self, forKey: .answer)
            assertEqual(answer, 42)
        }
    }

    func testUnkeyedContainer() {
        scope {
            let json = InputByteStream("[1,[2],[3],4]")
            let decoder = try _JSONDecoder(json)
            var container = try decoder.unkeyedContainer()
            let int1 = try container.decode(Int.self)
            var nested1 = try container.nestedUnkeyedContainer()
            let int2 = try nested1.decode(Int.self)
            var nested2 = try container.nestedUnkeyedContainer()
            let int3 = try nested2.decode(Int.self)
            let int4 = try container.decode(Int.self)
            assertEqual(int1, 1)
            assertEqual(int2, 2)
            assertEqual(int3, 3)
            assertEqual(int4, 4)
        }
    }

    func testSingleValueContainer() {
        scope {
            let json = InputByteStream("true")
            let decoder = try _JSONDecoder(json)
            let container = try decoder.singleValueContainer()
            let bool = try container.decode(Bool.self)
            assertEqual(bool, true)
        }
    }
}
