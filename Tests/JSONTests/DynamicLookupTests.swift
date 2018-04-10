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
