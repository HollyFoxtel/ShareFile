import XCTest

private var isSwiftTestingEnable: Bool = {
    var enabled = false
    #if canImport(Testing)
    enabled = true
    #endif
    return enabled
}()

struct ContentPage {
    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var swiftTestingLabel: XCUIElement {
        app.staticTexts["Hello Swift Testing"]
    }
}

class ContentViewUITests: XCTestCase {
    private var app: XCUIApplication!
    private var page: ContentPage!

    override func setUpWithError() throws {
        print("[init] SwiftTesting Enable Status: \(isSwiftTestingEnable)")

        continueAfterFailure = false
        app = XCUIApplication()
        page = ContentPage(app: app)
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testShouldShowSwiftTestingLabel() throws {
        XCTAssertTrue(page.swiftTestingLabel.exists, "The 'Hello Swift Testing' text should exist.")
    }
}
