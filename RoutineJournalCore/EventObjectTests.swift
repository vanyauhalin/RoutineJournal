// swiftlint:disable force_unwrapping
@testable import RoutineJournalCore
import XCTest

class EventObjectTests: XCTestCase {
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

  func test_eventObjectInitialization() {
    let startDate = Date.now
    let endDate = Calendar.current.date(
      bySetting: .hour,
      value: 1,
      of: startDate
    )!
    let event = EventObject(
      category: CategoryObject(
        title: "Category Title",
        icon: IconObject(
          name: .airplane,
          type: .system
        ),
        colorTheme: .amber
      ),
      title: "Event Title",
      notes: "Event notes",
      startDate: startDate,
      endDate: endDate
    )
    XCTAssertNotNil(event._id)
    XCTAssertEqual(event.startTime, startDate.timeIntervalSince1970)
    XCTAssertEqual(event.endTime, endDate.timeIntervalSince1970)
    XCTAssertEqual(event.startDate, startDate)
    XCTAssertEqual(event.endDate, endDate)
  }

  func test_updateEventObjectEndTime() {
    let startDate = Date.now
    let event = EventObject(
      category: CategoryObject(
        title: "Category Title",
        icon: IconObject(
          name: .airplane,
          type: .system
        ),
        colorTheme: .amber
      ),
      title: "Event Title",
      notes: "Event notes",
      startDate: startDate,
      endDate: Calendar.current.date(
        bySetting: .hour,
        value: 1,
        of: startDate
      )!
    )
    try? event.add()
    let endDate = Calendar.current.date(
      bySetting: .hour,
      value: 2,
      of: startDate
    )!
    try? event.update(endDate: endDate)
    XCTAssertEqual(event.endDate, endDate)
  }
}
