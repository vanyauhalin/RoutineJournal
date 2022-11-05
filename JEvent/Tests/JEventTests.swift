@testable import RoutineJournalJEvent
import RoutineJournalJCategory
import XCTest

class JEventTests: XCTestCase {
  func test_updateEndDate() {
    let event = JEvent(
      category: JCategory(
        title: "Category Title",
        colorTheme: .amber,
        icon: .airplane
      ),
      title: "Event Title",
      notes: nil,
      startDate: Date.now,
      endDate: Date.now
    )
    event.update(endDate: Calendar.current.date(
      byAdding: .day,
      value: 1,
      to: Date.now
    )!)
    XCTAssertEqual(
      event.endDate,
      Calendar.current.date(
        byAdding: .day,
        value: 1,
        to: Date.now
      ),
      "End date hasn't been updated"
    )
  }
}
