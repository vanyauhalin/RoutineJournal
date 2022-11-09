import RealmSwift
import RoutineJournalCore

public extension DataProvider {
  static func add(categoryItem: JCategoryItem) throws {
    return try add(categoryItem)
  }

  static func delete(categoryItem: JCategoryItem) throws {
    return try delete(categoryItem)
  }
}
