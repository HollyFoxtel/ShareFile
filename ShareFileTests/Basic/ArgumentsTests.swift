import XCTest

enum VideoQuality {
    case sd
    case hd
    case uhd4k

    var description: String {
        switch self {
        case .sd:
            return "Standard Definition"
        case .hd:
            return "High Definition"
        case .uhd4k:
            return "Ultra High Definition 4K"
        }
    }
}

struct TestData {
    let quality: VideoQuality
    let description: String

    init(quality: VideoQuality, description: String) {
        self.quality = quality
        self.description = description
    }
}

class VideoQualityTests: XCTestCase {
    func testVideoQualityDescriptions() {
        let testCases: [TestData] = [
            TestData(quality: .sd, description: "Standard Definition"),
            TestData(quality: .hd, description: "High Definition"),
            TestData(quality: .uhd4k, description: "Ultra High Definition 4K")
        ]

        for testCase in testCases {
            XCTAssertEqual(
                testCase.quality.description,
                testCase.description,
                "Failed for quality: \(testCase.quality)"
            )
        }
    }
}

#if canImport(Testing)
import Testing

struct VideoQualityArgumentsTests {
    @Test("Test Video Quality With Arugments", arguments: [
        TestData(quality: .sd, description: "Standard Definition"),
        TestData(quality: .hd, description: "High Definition"),
        TestData(quality: .uhd4k, description: "Ultra High Definition 4K"),
    ])
    func shouldGetDefaultName(itemPair: TestData) {
        #expect(itemPair.quality.description == itemPair.description)
    }
}

#endif
