import RealmSwift

public protocol ObjectConfiguration {
  associatedtype Object: RealmSwift.Object

  static func examples() -> [Object]
}
