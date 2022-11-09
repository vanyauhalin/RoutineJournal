import RoutineJournalCore
@testable import RoutineJournalUI
import XCTest

class IconTests: XCTestCase {
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

  func test_iconInitialization() {
    let icon = Icon(name: .airplane, type: .system)
    XCTAssertNotNil(icon._id)
    XCTAssertEqual(icon.name, .airplane)
    XCTAssertEqual(icon.type, .system)
  }

  func test_addAnIconToTheDatabase() {
    let icon = Icon(name: .airplane, type: .system)
    try? icon.add()
    XCTAssertFalse(icon.isInvalidated)
  }

  func test_deleteAnIconFromTheDatabase() {
    let icon = Icon(name: .airplane, type: .system)
    try? icon.add()
    try? icon.delete()
    XCTAssert(icon.isInvalidated)
  }
}
