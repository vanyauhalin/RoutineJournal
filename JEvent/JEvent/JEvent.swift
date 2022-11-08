import Foundation
import RoutineJournalJCategory

public class JEvent: JCategoryItem {
  public private(set) var startDate: Date
  public private(set) var endDate: Date?

  public init(
    category: JCategory,
    title: String,
    notes: String? = nil,
    startDate: Date,
    endDate: Date? = nil
  ) {
    self.startDate = startDate
    self.endDate = endDate
    super.init(category: category, title: title, notes: notes)
  }

  public func update(endDate: Date) {
    self.endDate = endDate
  }
}
