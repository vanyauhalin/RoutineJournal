import RealmSwift

public protocol ObjectConfiguration {
  associatedtype Object: RealmSwift.Object
  static var schemaVersion: UInt64 { get }
  static func migrationBlock(migration: Migration, oldSchemaVersion: UInt64)
  static func exampleData() -> [Object]
}
