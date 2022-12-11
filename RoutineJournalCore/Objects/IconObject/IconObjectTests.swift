@testable import RoutineJournalCore
import XCTest

class IconObjectTests: XCTestCase {
  override func setUp() {
    super.setUp()
    DataProvider.useMemory(self.name)
  }

  override func tearDown() {
    super.tearDown()
    try? DataProvider.write { realm in
      realm.deleteAll()
    }
  }

  func test_iconObjectInitialization() {
    let name = IconName.airplane
    let type = IconType.system
    let icon = IconObject(name: name, type: type)
    XCTAssertNotNil(icon._id)
    XCTAssertEqual(icon.name, name)
    XCTAssertEqual(icon.type, type)
  }
}
