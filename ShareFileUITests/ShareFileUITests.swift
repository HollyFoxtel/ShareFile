//
//  ShareFileUITests.swift
//  ShareFileUITests
//
//  Created by Holly-Fox on 2024/6/25.
//

import XCTest

final class ShareFileUITests: XCTestCase {
    let appGroupName = "group.tw.holly"

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
//        copyTestsToSharedFolder()
//        writeTestDataToGroupUserDefaults()
        // copyTestDataAppGroup() // NOTE: Not working

        let app = XCUIApplication()
        app.launch()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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

// MARK: - IPC
private extension ShareFileUITests {
    func writeTestDataToGroupUserDefaults() {
        if let userDefaults = UserDefaults(suiteName: appGroupName) {
            if let data = userDefaults.string(forKey: "sharedKey") {
                print("Received data: \(data)")
            }
        }
    }

    func copyTestDataAppGroup() {
        guard let appGroupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupName) else {
             XCTFail("Failed to get URL for app group \(appGroupName). Check your entitlements.")
            fatalError()
         }
    }

    func copyTestsToSharedFolder() {
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
        guard let simulatorSharedDir = ProcessInfo().environment["SIMULATOR_SHARED_RESOURCES_DIRECTORY"] else {
            return nil
        }

        let simulatorHomeDirURL = URL(fileURLWithPath: simulatorSharedDir)
        let cachesDirURL = simulatorHomeDirURL.appendingPathComponent("Library/Caches")

        guard FileManager.default.isWritableFile(atPath: cachesDirURL.path) else {
            return nil
        }

        let sharedFolderURL = cachesDirURL.appendingPathComponent("TestData")
        do {
            try FileManager.default.createDirectory(
                at: sharedFolderURL,
                withIntermediateDirectories: true,
                attributes: nil
            )

            return sharedFolderURL
        } catch {
            print("Failed to create shared folder \(sharedFolderURL.lastPathComponent) in simulator Caches directory at \(cachesDirURL)")
            return nil
        }
    }
}
