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
    try? DataProvider.add(icon: icon)
    XCTAssertFalse(icon.isInvalidated)
  }

  func test_findAnIconInTheDatabase() {
    let icon = Icon(name: .airplane, type: .system)
    try? DataProvider.add(icon: icon)
    let founded = try? DataProvider.findIcon(by: icon._id)
    XCTAssertEqual(icon._id, founded?._id)
    XCTAssertEqual(icon.name, founded?.name)
    XCTAssertEqual(icon.type, founded?.type)
  }

  func test_deleteAnIconFromTheDatabase() {
    let icon = Icon(name: .airplane, type: .system)
    try? DataProvider.add(icon: icon)
    try? DataProvider.delete(icon: icon)
    XCTAssert(icon.isInvalidated)
  }
}
