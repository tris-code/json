import XCTest

extension JSONDecoderTests {
    static let __allTests = [
        ("testDecodable", testDecodable),
        ("testEncodeUnkeyed", testEncodeUnkeyed),
        ("testEncodeUnkeyedOfUnkeyed", testEncodeUnkeyedOfUnkeyed),
        ("testEnum", testEnum),
        ("testKeyed", testKeyed),
        ("testKeyedNested", testKeyedNested),
        ("testKeyedNestedInTheMiddle", testKeyedNestedInTheMiddle),
        ("testNestedArrayInTheMiddle", testNestedArrayInTheMiddle),
        ("testNestedArraysInTheMiddle", testNestedArraysInTheMiddle),
    ]
}

extension JSONEncoderTests {
    static let __allTests = [
        ("testEncodable", testEncodable),
        ("testEncodeUnkeyed", testEncodeUnkeyed),
        ("testEncodeUnkeyedOfUnkeyed", testEncodeUnkeyedOfUnkeyed),
        ("testEnum", testEnum),
        ("testKeyed", testKeyed),
        ("testKeyedInTheMiddle", testKeyedInTheMiddle),
        ("testKeyedNested", testKeyedNested),
        ("testNestedArrayInTheMiddle", testNestedArrayInTheMiddle),
        ("testNestedInTheMiddle", testNestedInTheMiddle),
    ]
}

extension JSONTests {
    static let __allTests = [
        ("testDecode", testDecode),
        ("testDecodeEscaped", testDecodeEscaped),
        ("testDecodeEscapedUnicode", testDecodeEscapedUnicode),
        ("testEncode", testEncode),
    ]
}

extension JSONValueTests {
    static let __allTests = [
        ("testArray", testArray),
        ("testBool", testBool),
        ("testNested", testNested),
        ("testNull", testNull),
        ("testNumber", testNumber),
        ("testObject", testObject),
        ("testString", testString),
    ]
}

extension UnkeyedDecodingContainerTests {
    static let __allTests = [
        ("testNestedUnkeyedContainer", testNestedUnkeyedContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
    ]
}

extension UnkeyedEncodingContainerTests {
    static let __allTests = [
        ("testNestedUnkeyedContainer", testNestedUnkeyedContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
    ]
}

extension _JSONDecoderTests {
    static let __allTests = [
        ("testKeyedContainer", testKeyedContainer),
        ("testSingleValueContainer", testSingleValueContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
    ]
}

extension _JSONEncoderTests {
    static let __allTests = [
        ("testKeyedContainer", testKeyedContainer),
        ("testSingleValueContainer", testSingleValueContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(JSONDecoderTests.__allTests),
        testCase(JSONEncoderTests.__allTests),
        testCase(JSONTests.__allTests),
        testCase(JSONValueTests.__allTests),
        testCase(UnkeyedDecodingContainerTests.__allTests),
        testCase(UnkeyedEncodingContainerTests.__allTests),
        testCase(_JSONDecoderTests.__allTests),
        testCase(_JSONEncoderTests.__allTests),
    ]
}
#endif
