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
@testable import JSON

class DynamicLookupTests: TestCase {
    func testGet() {
        let value = JSON.Value.object(["key": .string("value")])
        assertEqual(value.key, .string("value"))
    }

    func testSet() {
        var value = JSON.Value.null
        value.key = .string("value")
        assertEqual(value, .object(["key": .string("value")]))
    }
}
