import XCTest
import Foundation

extension XCTestCase {
    /// sleep for a while
    /// - Parameter seconds: 要等待的秒数
    func waitFor(seconds: TimeInterval) {
        let expectation = XCTestExpectation(description: "Wait for \(seconds) second")

        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: seconds + 1)
    }

    func waitForAsync(seconds: TimeInterval) async throws {
        try await Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))
    }
}

func waitFor(seconds: TimeInterval) async throws {
    try await Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))
}
