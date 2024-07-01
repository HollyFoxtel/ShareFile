import XCTest

/// In XCTest,tests are executed sequentially, not in parallel. Methods within the same class are executed sequentially in alphabetical order
/// You can use`testInvocations` property to custom execution orde.
final class TestOrderTests: XCTestCase {
    func testA_CookCupcake() throws {
        print("[TestOrder] CookCupcake start")
        waitFor(seconds: 1)
        print("[TestOrder] CookCupcake end")
    }

    func testB_EatCupcake() throws {
        print("[TestOrder] EatCupcake")
    }
}
