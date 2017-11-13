/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension UInt8 {
    static let zero = UInt8(ascii: "0")
    static let nine = UInt8(ascii: "9")
    static let dot = UInt8(ascii: ".")
    static let comma = UInt8(ascii: ",")
    static let colon = UInt8(ascii: ":")
    static let quote = UInt8(ascii: "\"")
    static let hyphen = UInt8(ascii: "-")
    static let backslash = UInt8(ascii: "\\")
    static let whitespace = UInt8(ascii: " ")

    static let cr = UInt8(ascii: "\r")
    static let lf = UInt8(ascii: "\n")
    static let tab = UInt8(ascii: "\t")

    static let bracketOpen = UInt8(ascii: "[")
    static let bracketClose = UInt8(ascii: "]")
    static let curlyBracketOpen = UInt8(ascii: "{")
    static let curlyBracketClose = UInt8(ascii: "}")

    static let b = UInt8(ascii: "b")
    static let f = UInt8(ascii: "f")
    static let n = UInt8(ascii: "n")
    static let r = UInt8(ascii: "r")
    static let t = UInt8(ascii: "t")
    static let u = UInt8(ascii: "u")
}

extension Array where Element == UInt8 {
    static let null = [UInt8]("null".utf8)
    static let `true` = [UInt8]("true".utf8)
    static let `false` = [UInt8]("false".utf8)
}
