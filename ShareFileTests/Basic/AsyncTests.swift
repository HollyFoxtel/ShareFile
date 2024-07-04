import XCTest
import Foundation

enum VideoEvent {
    case playbackStarted
    case playbackPaused
    case playbackStopped
}

enum Video {
    case movie
    case tvShow
}

class VideoPlayer {
    static let shared = VideoPlayer()

    var eventHandler: ((VideoEvent) -> Void)?

    private init() {}

    func play(_ video: Video) async {
        try? await waitFor(seconds: 1)
        eventHandler?(.playbackStarted)
    }

    func pause() async {
        eventHandler?(.playbackPaused)
    }

    func stop() async {
        eventHandler?(.playbackStopped)
    }
}

class VideoPlayerTests: XCTestCase {
    func testVideoEvents() async throws {
        let playbackStarted = expectation(description: "Playback Started")

        VideoPlayer.shared.eventHandler = { event in
            if case .playbackStarted = event {
                playbackStarted.fulfill()
            }
        }

        await VideoPlayer.shared.play(.movie)
        await fulfillment(of: [playbackStarted])
    }
}

#if canImport(Testing)
import Testing

struct VideoPlaySwiftTests {
    @Test func videoEvents() async {
        await confirmation("Playback") { playbackStarted in
            VideoPlayer.shared.eventHandler = { event in
                if case .playbackStarted = event {
                    playbackStarted()
                }
            }
            await VideoPlayer.shared.play(.movie)
        }
    }
}

#endif
