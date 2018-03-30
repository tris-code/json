/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension JSON.Value {
    var booleanValue : Bool? {
        switch self {
        case .bool(let value): return value
        default: return nil
        }
    }

    var integerValue : Int? {
        switch self {
        case .number(.int(let value)): return value
        case .number(.uint(let value)) where value < UInt(Int.max):
            return Int(value)
        default: return nil
        }
    }

    var unsignedValue : UInt? {
        switch self {
        case .number(.uint(let value)): return value
        case .number(.int(let value)) where value >= 0: return UInt(value)
        default: return nil
        }
    }

    var doubleValue : Double? {
        switch self {
        case .number(.double(let value)): return value
        case .number(.int(let value)): return Double(value)
        case .number(.uint(let value)): return Double(value)
        default: return nil
        }
    }

    var stringValue : String? {
        switch self {
        case .string(let value): return value
        default: return nil
        }
    }

    subscript(index: Int) -> JSON.Value? {
        switch self {
        case .array(let array) where index < array.count: return array[index]
        default: return nil
        }
    }

    subscript(key: String) -> JSON.Value? {
        switch self {
        case .object(let object): return object[key]
        default: return nil
        }
    }
}