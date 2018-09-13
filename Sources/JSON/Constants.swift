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

extension Array where Element == UInt8 {
    static let null = [UInt8]("null".utf8)
    static let `true` = [UInt8]("true".utf8)
    static let `false` = [UInt8]("false".utf8)
}
