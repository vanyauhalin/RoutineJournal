import Combine
import Foundation
import RoutineJournalCore
import RoutineJournalFoundation

public final class EventFormModel: ObservableObject {
  @Published public var title: String
  @Published public var category: CategoryObject?
  @Published public var notes: String
  @Published public var startDate: Date
  @Published public var endDate: Date

  public init(
    title: String = "",
    category: CategoryObject? = nil,
    notes: String = "",
    startDate: Date = Date.now,
    endDate: Date = Date.since1970
  ) {
    self.title = title
    self.category = category
    self.notes = notes
    self.startDate = startDate
    self.endDate = endDate
  }
}
