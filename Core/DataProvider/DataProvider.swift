import Realm
import RealmSwift

public enum DataProvider {
  enum DataProviderError: Error {
    case add(Error)
    case find(Error)
    case delete(Error)
  }

  public static func useMemory(_ identifier: String) {
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = identifier
  }

  public static func write(action: (Realm) -> Void)
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

  public static func add<Object>(_ object: Object)
  throws where Object: RealmSwift.Object {
    do {
      try DataProvider.write { realm in
        realm.add(object)
      }
    } catch let error {
      throw DataProviderError.add(error)
    }
  }

  public static func delete<Object>(_ object: Object)
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
