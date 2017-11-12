/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

final class Storage {
    var json = [UInt8]()

    init() {}

    init(reservingCapacity capacity: Int) {
        json.reserveCapacity(capacity)
    }

    @inline(__always)
    func write(_ byte: UInt8) {
        json.append(byte)
    }

    @inline(__always)
    func write(_ bytes: [UInt8]) {
        json.append(contentsOf: bytes)
    }

    @inline(__always)
    func write(_ string: String) {
        json.append(contentsOf: string.utf8)
    }
}
