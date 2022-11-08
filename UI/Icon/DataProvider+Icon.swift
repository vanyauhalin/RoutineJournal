import RealmSwift
import RoutineJournalCore

public extension DataProvider {
  static func add(icon: Icon) throws {
    return try add(icon)
  }

  static func findIcon(by identifier: ObjectId) throws -> Icon? {
    return try find(ofType: Icon.self, by: identifier)
  }

  static func delete(icon: Icon) throws {
    return try delete(icon)
  }
}
