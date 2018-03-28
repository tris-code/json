import XCTest

extension DecodeValueTests {
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

extension DecoderTests {
    static let __allTests = [
        ("testKeyedContainer", testKeyedContainer),
        ("testSingleValueContainer", testSingleValueContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
    ]
}

extension EncoderTests {
    static let __allTests = [
        ("testKeyedContainer", testKeyedContainer),
        ("testSingleValueContainer", testSingleValueContainer),
        ("testUnkeyedContainer", testUnkeyedContainer),
    ]
}

extension JSONDecoderTests {
    static let __allTests = [
        ("testDecodable", testDecodable),
        ("testEnum", testEnum),
        ("testKeyed", testKeyed),
        ("testKeyedNested", testKeyedNested),
        ("testKeyedNestedInTheMiddle", testKeyedNestedInTheMiddle),
        ("testNestedArrayInTheMiddle", testNestedArrayInTheMiddle),
        ("testNestedArraysInTheMiddle", testNestedArraysInTheMiddle),
        ("testUnkeyed", testUnkeyed),
        ("testUnkeyedOfUnkeyed", testUnkeyedOfUnkeyed),
    ]
}

extension JSONEncoderTests {
    static let __allTests = [
        ("testEncodable", testEncodable),
        ("testEnum", testEnum),
        ("testKeyed", testKeyed),
        ("testKeyedInTheMiddle", testKeyedInTheMiddle),
        ("testKeyedNested", testKeyedNested),
        ("testNestedArrayInTheMiddle", testNestedArrayInTheMiddle),
        ("testNestedInTheMiddle", testNestedInTheMiddle),
        ("testUnkeyed", testUnkeyed),
        ("testUnkeyedOfUnkeyed", testUnkeyedOfUnkeyed),
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

extension PublicAPITests {
    static let __allTests = [
        ("testJSONEncoder", testJSONEncoder),
        ("testJSONEncoderEncode", testJSONEncoderEncode),
    ]
}

extension UnkeyedDecodingContainerTests {
    static let __allTests = [
        ("testContainer", testContainer),
        ("testNestedContainer", testNestedContainer),
    ]
}

extension UnkeyedEncodingContainerTests {
    static let __allTests = [
        ("testContainer", testContainer),
        ("testNestedContainer", testNestedContainer),
        ("testNull", testNull),
    ]
}

extension ValueTests {
    static let __allTests = [
        ("testArray", testArray),
        ("testBoolean", testBoolean),
        ("testDouble", testDouble),
        ("testInteger", testInteger),
        ("testObject", testObject),
        ("testString", testString),
        ("testUnsigned", testUnsigned),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DecodeValueTests.__allTests),
        testCase(DecoderTests.__allTests),
        testCase(EncoderTests.__allTests),
        testCase(JSONDecoderTests.__allTests),
        testCase(JSONEncoderTests.__allTests),
        testCase(JSONTests.__allTests),
        testCase(PublicAPITests.__allTests),
        testCase(UnkeyedDecodingContainerTests.__allTests),
        testCase(UnkeyedEncodingContainerTests.__allTests),
        testCase(ValueTests.__allTests),
    ]
}
#endif
