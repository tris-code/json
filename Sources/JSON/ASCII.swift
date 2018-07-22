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

    static let squareBracketOpen = UInt8(ascii: "[")
    static let squareBracketClose = UInt8(ascii: "]")
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
