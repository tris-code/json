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
import JSON // don't use @testable

class PublicAPITests: TestCase {
    func testJSONEncoder() {
        scope {
            try JSON.withScopedEncoder(using: OutputByteStream()) { encoder in

            }
        }
    }

    func testJSONDecoder() {
        scope {
            try JSON.withScopedDecoder(using: InputByteStream("null"))
            { decoder in

            }
        }
    }
}
