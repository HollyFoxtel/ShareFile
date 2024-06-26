//
//  ShareFileUITests.swift
//  ShareFileUITests
//
//  Created by Holly-Fox on 2024/6/25.
//

import XCTest

final class ShareFileUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
//        copyTestJson()
        let app = XCUIApplication()
        app.launch()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func copyTestJson() {
        guard let bundlePath = Bundle(for: Self.self).path(forResource: "api_billing_holly", ofType: "json") else {
            return
        }

        guard let containerURL = sharedFolderURL() else  {
            XCTFail("Failed to init bundle")
            return
        }

        let destinationURL = containerURL.appendingPathComponent("MockMappings.json")
        do {
            try FileManager.default.copyItem(atPath: bundlePath, toPath: destinationURL.path)
        } catch {
            XCTFail("Failed to copy bundle: \(error)")
        }
    }

    private func sharedFolderURL() -> URL? {
        if let simulatorSharedDir = ProcessInfo().environment["SIMULATOR_SHARED_RESOURCES_DIRECTORY"] {
            // running on the simulator. We'll write to ~/Library/Caches
            let simulatorHomeDirURL = URL(fileURLWithPath: simulatorSharedDir)
            let cachesDirURL = simulatorHomeDirURL.appendingPathComponent("Library/Caches")
            XCTAssertTrue(FileManager.default.isWritableFile(atPath: cachesDirURL.path), "Cannot write to simulator Caches directory")
            let sharedFolderURL = cachesDirURL.appendingPathComponent("Secrets")
            XCTAssertNoThrow( try FileManager.default.createDirectory(at: sharedFolderURL, withIntermediateDirectories: true, attributes: nil), "Failed to create shared folder \(sharedFolderURL.lastPathComponent) in simulator Caches directory at \(cachesDirURL)")
            return sharedFolderURL
        }

        return nil
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
