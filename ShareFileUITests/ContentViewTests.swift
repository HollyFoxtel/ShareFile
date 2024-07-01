import XCTest

class ContentViewUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testShowLabelTextDisplay() throws {
        let helloWorldText = app.staticTexts["Hello, world!"]
        XCTAssertTrue(helloWorldText.exists, "The 'Hello, world!' text should exist.")
    }
}
