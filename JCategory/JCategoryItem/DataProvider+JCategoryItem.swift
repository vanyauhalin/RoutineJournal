import RealmSwift
import RoutineJournalCore

public extension DataProvider {
  static func add(categoryItem: JCategoryItem) throws {
    return try add(categoryItem)
  }

  static func findCategoryItem(by identifier: ObjectId)
  throws -> JCategoryItem? {
    return try find(ofType: JCategoryItem.self, by: identifier)
  }

  static func delete(categoryItem: JCategoryItem) throws {
    return try delete(categoryItem)
  }
}
