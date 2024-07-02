import XCTest

#if canImport(Testing)
import Testing
#endif

// MARK: - Test Mix Success
final class SwiftTestingInXCTests: XCTestCase {
    func testNormalTest() throws {
        XCTAssertTrue(true)
    }

    @Test("Swift Testing Should Pass Expect Fullfiled")
    func swiftTestingInSideXcTest() {
        let word = "hello"
        #expect(word == "hello")
    }

    @Test("Swift Testing Should Failed Expect Not Satisfied")
    func swiftTestingShouldFailInXcTest() {
        let word = "hello"
        #expect(word == "Not hello")
    }
}

// MARK: - Test Conflict
extension SwiftTestingInXCTests {
//    @Test("Test Will Conflict With test prefix in XCTests")
    @Test(.disabled())
    func testSwiftTestingWithTestPrefix() {
        #expect(true)
    }
}

// MARK: - Test Mix Expect in XCTest
extension SwiftTestingInXCTests {
    func testUseExpectInXCTestWhenExpectFailedInTest() {
        #expect(false)
    }

    func testUseExpectInXCTestWhenExpectFailedInTest2() {
        #expect(true)
    }

    @Test("Test use XCAsset in Swfit Testing")
    func shoudlFailWhenExpectFailedInTest() {
        XCTAssertTrue(false)
    }
}

// MARK: - Test Mix XCTAssertTrue in Swift Test
struct XCTestInSwiftTesting {
    @Test("Asset") func shouldFailWhenXCAssetTrueIsFalse() {
        XCTAssertTrue(false)
    }
}
