import XCTest
import Foundation

// @Suite("Test Final Class") This will get Error
class NoFinalClass {

}

#if canImport(Testing)
import Testing

struct VideoPlayViewModelNoSuiteTests {
    @Test func playVideo() {  }
}

//@Suite("Video Play Rate", .serialized)
@Suite("Video Play Rate")
final class VideoPlayViewModelTests {
    var playRate: Double
    init() {
        playRate = 0
    }

    deinit {
        playRate = 1
    }

    @Test func playVideoRateSet_0_5() async {
        print("playVideoRate1, rate is \(playRate)")
        playRate = 0.5
    }

    @Test func playVideoRateRead() async {
        try? await waitFor(seconds: 1)
        print("playVideoRate2, rate is \(playRate)")
    }
}

@Suite("Video Play Tests")
struct VideoPlayViewModelNestTests {
    @Suite("Video Play - Success")
    struct Success {
        @Test func playVideoSuccessfully() {

        }
    }
}

#endif
