import XCTest

#if canImport(Testing)
import Testing

struct ControlTests {
    @Test(.disabled("This test always fail on one of CI, Fix later"))
    func testFailOnCI() { }

    @Test("fetch video known issue failed and skip")
    func fetchVideoMetaDataFailed()  {
        withKnownIssue(
            "A known issue caused, Cause this test random failed. Fix it later",
            isIntermittent: true
        ) {
            try alwaysFailJob()
        }
    }

    @Test("fetch video known issue success")
    func fetchVideoMetaDataSuccess()  {
        withKnownIssue(
            "A known issue caused, Cause this test random failed. Fix it later",
            isIntermittent: true
        ) {
            try alwaysSuccessJob()
        }
    }
}

extension ControlTests {
    enum ControlError: Error {
        case knownIssue
    }

    func alwaysFailJob() throws {
        throw ControlError.knownIssue
    }

    func alwaysSuccessJob() throws {

    }
}

#endif
