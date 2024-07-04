#if canImport(Testing)
import Testing

private extension Tag {
  @Tag static var upNext: Self
  @Tag static var login: Self
  @Tag static var continueWatching: Self
}

struct CustomTagTests {
    @Test(.tags(.continueWatching))
    func myContinueWatchingTest() {

    }

    @Test(.tags(.login))
    func myLoginTest() {

    }

    @Test(.tags(.upNext))
    func myUpNextAirPlay() {

    }

    @Test(.tags(.upNext))
    func myUpNextChromeCast() {

    }
}

#endif
