import Realm
import RealmSwift

public enum DataProvider {
  enum DataProviderError: Error {
    case add(Error)
    case find(Error)
    case delete(Error)
  }
}

public extension DataProvider {
  static func useMemory(_ identifier: String) {
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = identifier
  }

  static func write(action: (Realm) -> Void)
  throws {
    do {
      let realm = try Realm()
      try realm.write {
        action(realm)
      }
    } catch let error {
      throw error
    }
  }

  static func add<Object>(_ object: Object)
  throws where Object: RealmSwift.Object {
    do {
      try DataProvider.write { realm in
        realm.add(object)
      }
    } catch let error {
      throw DataProviderError.add(error)
    }
  }

  static func find<Object>(ofType type: Object.Type, by identifier: ObjectId)
  throws -> Object? where Object: RealmSwift.Object {
    do {
      var object: Object?
      try DataProvider.write { realm in
        object = realm.object(ofType: Object.self, forPrimaryKey: identifier)
      }
      return object
    } catch let error {
      throw DataProviderError.find(error)
    }
  }

  static func delete<Object>(_ object: Object)
  throws where Object: ObjectBase {
    do {
      try DataProvider.write { realm in
        realm.delete(object)
      }
    } catch let error {
      throw DataProviderError.delete(error)
    }
  }
}
