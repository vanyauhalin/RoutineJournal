import RealmSwift
import RoutineJournalCore

public extension DataProvider {
  static func add(event: JEvent) throws {
    return try add(event)
  }

  static func findEvent(by identifier: ObjectId) throws -> JEvent? {
    return try find(ofType: JEvent.self, by: identifier)
  }

  static func delete(event: JEvent) throws {
    return try delete(event)
  }
}
