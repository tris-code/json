/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************
 *  This file contains code that has not yet been described                   *
 ******************************************************************************/

import Stream

extension Set where Element == UInt8 {
    static let controls: Set<UInt8> = [.cr, .lf, .tab]

    static var whitespaces: Set<UInt8> = [.whitespace, .cr, .lf, .tab]

    static let terminators: Set<UInt8> = [
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
