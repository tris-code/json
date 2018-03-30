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
