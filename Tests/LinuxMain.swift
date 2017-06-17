import XCTest
@testable import JSONTests

XCTMain([
    testCase(_JSONDecoderTests.allTests),
    testCase(_JSONEncoderTests.allTests),
    testCase(JSONDecoderTests.allTests),
    testCase(JSONEncoderTests.allTests),
    testCase(JSONObjectTests.allTests),
    testCase(JSONTests.allTests),
    testCase(UnkeyedDecodingContainerTests.allTests),
    testCase(UnkeyedEncodingContainerTests.allTests),
])
