import RealmSwift

extension Object {
  public func add() throws {
    try DataProvider.add(self)
  }

  public func delete() throws {
    try DataProvider.delete(self)
  }
}
