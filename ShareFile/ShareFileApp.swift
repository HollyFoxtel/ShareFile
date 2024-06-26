//
//  ShareFileApp.swift
//  ShareFile
//
//  Created by Holly-Fox on 2024/6/25.
//

import SwiftUI

private func sharedFolderURL() -> URL? {
    if let simulatorSharedDir = ProcessInfo().environment["SIMULATOR_SHARED_RESOURCES_DIRECTORY"] {
        // running on the simulator. We'll write to ~/Library/Caches
        let simulatorHomeDirURL = URL(fileURLWithPath: simulatorSharedDir)
        let cachesDirURL = simulatorHomeDirURL.appendingPathComponent("Library/Caches")
        let sharedFolderURL = cachesDirURL.appendingPathComponent("Secrets")
        return sharedFolderURL
    }

    return nil
}

@main
struct ShareFileApp: App {
    init() {
        guard let containerURL = sharedFolderURL() else  {
              return
          }

        let destinationURL = containerURL.appendingPathComponent("MockMappings.json")
        guard let fileContent = try? String(contentsOf: destinationURL, encoding: .utf8) else {
            return
        }

        print ("\(fileContent)")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
