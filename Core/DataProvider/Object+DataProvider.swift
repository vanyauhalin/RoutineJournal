import RealmSwift

public extension Object {
  func add() throws {
    return try DataProvider.add(self)
  }

  func delete() throws {
    return try DataProvider.delete(self)
  }
}
