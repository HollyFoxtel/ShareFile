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

@Suite("Video Play Success Tests")
struct VideoPlayViewModelTests {
    @Test func playVideoSuccessfully() {

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
