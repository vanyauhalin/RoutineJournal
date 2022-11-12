import RoutineJournalCore
import RoutineJournalJCategory
@testable import RoutineJournalJEvent
import RoutineJournalUI
import XCTest

class JEventTests: XCTestCase {
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

  func test_eventInitialization() {
    let startDate = Date.now
    let endDate = Calendar.current.date(
      bySetting: .hour,
      value: 1,
      of: startDate
    )
    let event = JEvent(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Event Title",
      notes: "Event notes",
      startDate: startDate,
      endDate: endDate
    )
    XCTAssertNotNil(event._id)
    XCTAssertEqual(event.startTime, startDate.timeIntervalSince1970)
    XCTAssertEqual(event.endTime, endDate?.timeIntervalSince1970)
  }

  func test_addAnEventToTheDatabase() {
    let event = JEvent(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Event Title",
      notes: "Event notes",
      startDate: Date.now,
      endDate: Date.now
    )
    try? event.add()
    XCTAssertFalse(event.isInvalidated)
  }

  func test_deleteAnEventToTheDatabase() {
    let event = JEvent(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Event Title",
      notes: "Event notes",
      startDate: Date.now,
      endDate: Date.now
    )
    try? event.add()
    try? event.delete()
    XCTAssert(event.isInvalidated)
  }

  func test_updateEventEndDate() {
    let startDate = Date.now
    let endDate = Calendar.current.date(
      bySetting: .hour,
      value: 1,
      of: startDate
    )
    let event = JEvent(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Event Title",
      notes: "Event notes",
      startDate: startDate,
      endDate: endDate
    )
    try? event.add()
    if
      let endDate = endDate,
      let newEndDate = Calendar.current.date(
        bySetting: .hour,
        value: 1,
        of: endDate
      )
    {
      try? event.update(endDate: newEndDate)
      XCTAssertEqual(event.endTime, newEndDate.timeIntervalSince1970)
      return
    }
    XCTFail("Error creating new end date")
  }
}
