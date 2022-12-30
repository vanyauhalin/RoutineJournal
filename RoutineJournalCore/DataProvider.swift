import RealmSwift

public enum DataProvider {
  public static var configuration = Realm.Configuration()

  public static var configurations: [any ObjectConfiguration.Type] {
    [
      IconObjectConfiguration.self,
      CategoryObjectConfiguration.self,
      EventObjectConfiguration.self
    ]
  }

  public static func realm() throws -> Realm {
    try Realm(configuration: configuration)
  }

  public static func write(action: (Realm) -> Void) throws {
    let realm = try realm()
    try realm.write {
      action(realm)
    }
  }

  public static func add<Object>(_ object: Object) throws
  where Object: RealmSwift.Object {
    try write { realm in
      realm.add(object)
    }
  }

  public static func delete<Object>(_ object: Object) throws
  where Object: ObjectBase {
    try write { realm in
      realm.delete(object)
    }
  }
}
