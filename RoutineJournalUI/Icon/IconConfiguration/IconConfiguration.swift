import RealmSwift
import RoutineJournalCore

public struct IconConfiguration: ObjectConfiguration {
  public typealias Object = Icon

  public static let schemaVersion: UInt64 = 0
  public static func migrationBlock(
    migration: Migration,
    oldSchemaVersion: UInt64
  ) {}

  public static func exampleData() -> [Object] {
    return [
      Icon(name: .airplane, type: .system),
      Icon(name: .cart, type: .system)
    ]
  }
}
