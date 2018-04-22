/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

import Test
import Stream
@testable import JSON

class UnkeyedEncodingContainerTests: TestCase {
    func testContainer() {
        scope {
            let output = OutputByteStream()
            let encoder = Encoder(output)
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
            let encoder = Encoder(output)
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
            let encoder = Encoder(output)
            var unkeyedContainer = encoder.unkeyedContainer()
            try unkeyedContainer.encodeNil()
            try unkeyedContainer.encodeNil()
            try encoder.close()
            assertEqual(output.string, "[null,null]")
        }
    }
}
