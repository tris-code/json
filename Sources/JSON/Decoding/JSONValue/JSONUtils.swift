/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension Array where Element == UInt8 {
    func formIndex(
        from index: inout Int,
        consuming characters: Set<UInt8>
    ) {
        while index < endIndex, characters.contains(self[index]) {
            formIndex(after: &index)
        }
    }
}

extension Set where Element == UInt8 {
    static let control: Set<UInt8> = [
        UInt8(ascii: "\r"),
        UInt8(ascii: "\n"),
        UInt8(ascii: "\t")
    ]

    static var whitespace: Set<UInt8> = [
        UInt8(ascii: " "),
        UInt8(ascii: "\r"),
        UInt8(ascii: "\n"),
        UInt8(ascii: "\t")
    ]

    static let terminator: Set<UInt8> = [
        UInt8(ascii: " "),
        UInt8(ascii: "\r"),
        UInt8(ascii: "\n"),
        UInt8(ascii: "\t"),
        UInt8(ascii: ","),
        UInt8(ascii: "}"),
        UInt8(ascii: "]")
    ]
}

extension UInt8 {
    func contained(in set: Set<UInt8>) -> Bool {
        return set.contains(self)
    }
}
