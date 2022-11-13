import Foundation
import RealmSwift
import RoutineJournalCategory
import RoutineJournalCore

public class Event: CategoryItem {
  @Persisted(primaryKey: true) public private(set) var _id: ObjectId
  @Persisted public private(set) var startTime: TimeInterval
  @Persisted public private(set) var endTime: TimeInterval?

  public var startDate: Date {
    Date(timeIntervalSince1970: startTime)
  }
  public var endDate: Date? {
    if let endTime = endTime {
      return Date(timeIntervalSince1970: endTime)
    }
    return nil
  }

  public convenience init(
    category: RoutineJournalCategory.Category,
    title: String,
    notes: String? = nil,
    startDate: Date,
    endDate: Date? = nil
  ) {
    self.init(category: category, title: title, notes: notes)
    self.startTime = startDate.timeIntervalSince1970
    self.endTime = endDate?.timeIntervalSince1970
  }

  public func update(endDate: Date) throws {
    return try DataProvider.write { _ in
      self.endTime = endDate.timeIntervalSince1970
    }
  }
}