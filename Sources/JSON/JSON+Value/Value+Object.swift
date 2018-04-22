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

extension Dictionary where Key == String, Value == JSON.Value {
    public init(from stream: StreamReader) throws {
        guard try stream.consume(.curlyBracketOpen) else {
            throw JSON.Error.invalidJSON
        }

        var result = [String : JSON.Value]()
        loop: while true {
            try stream.consume(set: .whitespaces)

            switch try stream.peek() {
            case .curlyBracketClose:
                try stream.consume(count: 1)
                break loop
            case .quote:
                let key = try String(from: stream)
                try stream.consume(set: .whitespaces)
                guard try stream.consume(.colon) else {
                    throw JSON.Error.invalidJSON
                }
                try stream.consume(set: .whitespaces)
                result[key] = try JSON.Value(from: stream)
            case .comma:
                try stream.consume(count: 1)
            default:
                throw JSON.Error.invalidJSON
            }
        }
        self = result
    }
}
