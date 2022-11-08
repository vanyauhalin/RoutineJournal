import RealmSwift
import RoutineJournalCore

public extension DataProvider {
  static func add(category: JCategory) throws {
    return try add(category)
  }

  static func findCategory(by identifier: ObjectId) throws -> JCategory? {
    return try find(ofType: JCategory.self, by: identifier)
  }

  static func delete(category: JCategory) throws {
    return try delete(category)
  }
}
