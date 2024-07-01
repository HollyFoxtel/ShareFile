import XCTest

#if canImport(Testing)
import Testing
#endif

/// In XCTest, Tests are executed sequentially, not in parallel. Methods within the same class are executed sequentially in alphabetical order
/// You can use`testInvocations` property to custom execution orde.
final class TestOrderXCTests: XCTestCase {
    private static var startTime: Date?
    private static var endTime: Date?

    override class func setUp() {
        super.setUp()
        startTime = Date()
    }

    override class func tearDown() {
        super.tearDown()

        endTime = Date()

        if let start = startTime, let end = endTime {
            let executionTime = end.timeIntervalSince(start)
            print("[TestOrder] Total execution time: \(executionTime) seconds")
        }
    }


    func testA_CookCupcake() throws {
        print("[TestOrder] CookCupcake start")
        waitFor(seconds: 1)
        print("[TestOrder] CookCupcake end")
    }

    func testB_EatCupcake() throws {
        print("[TestOrder] EatCupcake start")
        waitFor(seconds: 1)
        print("[TestOrder] EatCupcake end")
    }
}

#if canImport(Testing)

/// In Swift Testing, Tests are executed parallel by Default
@Suite("Test Parallel Run Tests in Swift Test")
struct TestOrderParallel {
    @Test func testA_CookCupcake() async throws {
        print("[TestOrder] CookCupcake start")
        try await waitFor(seconds: 1)
        print("[TestOrder] CookCupcake end")
    }

    @Test func testA_EatCupcake() async throws {
        print("[TestOrder] EatCupcake start")
        try await waitFor(seconds: 1)
        print("[TestOrder] EatCupcake end")
    }
}

/// In Swift Testing, We can mark suite as `serialized` to run tests sequentially
@Suite("Test Sequentially Run Tests", .serialized)
struct TestOrderSequence {
    @Test func testA_CookCupcake() async throws {
        print("[TestOrder] CookCupcake start")
        try await waitFor(seconds: 1)
        print("[TestOrder] CookCupcake end")
    }

    @Test func testA_EatCupcake() async throws {
        print("[TestOrder] EatCupcake start")
        try await waitFor(seconds: 1)
        print("[TestOrder] EatCupcake end")
    }
}

#endif
