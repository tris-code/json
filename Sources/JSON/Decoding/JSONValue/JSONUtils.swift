/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Stream

extension Set where Element == UInt8 {
    static let control: Set<UInt8> = [.cr, .lf, .tab]

    static var whitespace: Set<UInt8> = [.whitespace, .cr, .lf, .tab]

    static let terminator: Set<UInt8> = [
        .whitespace, .cr, .lf, .tab, .comma, .curlyBracketClose, .bracketClose
    ]
}

extension StreamReader {
    @inline(__always)
    func consume(set: Set<UInt8>) throws {
        try consume { set.contains($0) }
    }
}

extension UInt8 {
    @inline(__always)
    func contained(in set: Set<UInt8>) -> Bool {
        return set.contains(self)
    }
}
