import Foundation
import RealmSwift
import RoutineJournalCore
import RoutineJournalJCategory

public class JEvent: Object {
  @Persisted(primaryKey: true) public private(set) var _id: ObjectId
  @Persisted public private(set) var calendarItem: JCategoryItem?
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
    category: JCategory,
    title: String,
    notes: String? = nil,
    startDate: Date,
    endDate: Date? = nil
  ) {
    self.init()
    self.calendarItem = JCategoryItem(
      category: category,
      title: title,
      notes: notes
    )
    self.startTime = startDate.timeIntervalSince1970
    self.endTime = endDate?.timeIntervalSince1970
  }

  public func update(endDate: Date) throws {
    return try DataProvider.write { _ in
      self.endTime = endDate.timeIntervalSince1970
    }
  }
}
