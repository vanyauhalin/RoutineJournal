import Foundation
import RealmSwift

public final class EventObject: CategoryItemObject {
  @Persisted public var startTime = TimeInterval()
  @Persisted public var endTime = TimeInterval()

  public var startDate: Date {
    Date(timeIntervalSince1970: startTime)
  }
  public var endDate: Date {
    Date(timeIntervalSince1970: endTime)
  }

  public convenience init(
    category: CategoryObject,
    title: String,
    notes: String = "",
    startDate: Date,
    endDate: Date = Date.since1970
  ) {
    self.init(category: category, title: title, notes: notes)
    self.startTime = startDate.timeIntervalSince1970
    self.endTime = endDate.timeIntervalSince1970
  }

  public static func objects() -> Results<EventObject>? {
    try? DataProvider.realm().objects(EventObject.self)
  }

  public func update(endDate: Date) throws {
    try DataProvider.write { _ in
      self.endTime = endDate.timeIntervalSince1970
    }
  }
}
