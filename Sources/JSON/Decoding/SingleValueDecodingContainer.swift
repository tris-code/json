struct JSONSingleValueDecodingContainer: SingleValueDecodingContainer {
    var codingPath: [CodingKey] {
        return []
    }

    var value: JSON.Value
    init(_ value: JSON.Value) {
        self.value = value
    }

    @inline(__always)
    private func inlinedDecode<T: JSONValueInitializable>(
        _ type: T.Type
    ) throws -> T {
        guard let value = T(self.value) else {
            throw DecodingError.typeMismatch(
                type, .incompatible(with: self.value))
        }
        return value
    }

    func decodeNil() -> Bool {
        guard case .null = value else {
            return false
        }
        return true
    }

    func decode(_ type: Bool.Type) throws -> Bool {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int.Type) throws -> Int {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int8.Type) throws -> Int8 {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int16.Type) throws -> Int16 {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int32.Type) throws -> Int32 {
        return try inlinedDecode(type)
    }

    func decode(_ type: Int64.Type) throws -> Int64 {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt.Type) throws -> UInt {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt8.Type) throws -> UInt8 {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt16.Type) throws -> UInt16 {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt32.Type) throws -> UInt32 {
        return try inlinedDecode(type)
    }

    func decode(_ type: UInt64.Type) throws -> UInt64 {
        return try inlinedDecode(type)
    }

    func decode(_ type: Float.Type) throws -> Float {
        return try inlinedDecode(type)
    }

    func decode(_ type: Double.Type) throws -> Double {
        return try inlinedDecode(type)
    }

    func decode(_ type: String.Type) throws -> String {
        return try inlinedDecode(type)
    }

    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        let decoder = try JSON.Decoder(value)
        return try T(from: decoder)
    }
}
