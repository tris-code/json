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

extension String {
    init(from stream: StreamReader) throws {
        guard try stream.consume(.quote) else {
            throw JSON.Error.invalidJSON
        }

        var result: [UInt8] = []

        func readEscaped() throws {
            switch try stream.read(UInt8.self) {
            case .quote: result.append(.quote)
            case .n: result.append(.lf)
            case .r: result.append(.cr)
            case .t: result.append(.tab)
            case .backslash: result.append(.backslash)
            case .u: try readUnicodeScalar()
            default: throw JSON.Error.invalidJSON
            }
        }

        func readUnicodeScalar() throws {
            let code = try stream.read(count: 4) { buffer in
                return Int(hex: buffer)
            }
            guard let scalar = Unicode.Scalar(code),
                let encoded = UTF8.encode(scalar) else
            {
                throw JSON.Error.invalidJSON
            }

            result.append(contentsOf: encoded)
        }

        loop: while true {
            let character = try stream.read(UInt8.self)
            switch character {
            case .quote:
                break loop
            case .backslash:
                try readEscaped()
            case _ where character.contained(in: .controls):
                throw JSON.Error.invalidJSON
            default:
                result.append(character)
            }
        }

        self = String(decoding: result, as: UTF8.self)
    }
}
