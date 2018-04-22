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
import Platform

extension JSON.Value.Number {
    public init(from stream: StreamReader) throws {
        let isNegative = try stream.consume(.hyphen) ? true : false
        var isInteger = true

        var string = [UInt8]()

        try stream.read(while: { $0 >= .zero && $0 <= .nine }) { bytes in
            string.append(contentsOf: bytes)
        }

        if (try? stream.consume(.dot)) ?? false {
            isInteger = false
            string.append(.dot)
            try stream.read(while: { $0 >= .zero && $0 <= .nine }) { bytes in
                string.append(contentsOf: bytes)
            }
        }
        string.append(0)

        let pointer = UnsafeRawPointer(string)
            .assumingMemoryBound(to: Int8.self)

        switch isNegative {
        case true:
            switch isInteger {
            case true: self = .int(-strtol(pointer, nil, 10))
            case false: self = .double(-strtod(pointer, nil))
            }
        case false:
            switch isInteger {
            case true: self = .uint(strtoul(pointer, nil, 10))
            case false: self = .double(strtod(pointer, nil))
            }
        }
    }
}

extension JSON.Value.Number: Equatable {
    public static func ==(
        lhs: JSON.Value.Number,
        rhs: JSON.Value.Number) -> Bool
    {
        switch (lhs, rhs) {
        case let (.int(lhs), .int(rhs)): return lhs == rhs
        case let (.uint(lhs), .uint(rhs)): return lhs == rhs
        case let (.double(lhs), .double(rhs)): return lhs == rhs
        default: return false
        }
    }
}

extension JSON.Value.Number: CustomStringConvertible {
    public var description: String {
        switch self {
        case .int(let int): return int.description
        case .uint(let uint): return uint.description
        case .double(let double): return double.description
        }
    }
}
