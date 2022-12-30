import RealmSwift

open class CategoryItemObject: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) public var _id: ObjectId
  @Persisted public var category: CategoryObject?
  @Persisted public var title = ""
  @Persisted public var notes = ""

  public convenience init(
    category: CategoryObject,
    title: String,
    notes: String = ""
  ) {
    self.init()
    self.category = category
    self.title = title
    self.notes = notes
  }

  public func update(category: CategoryObject) throws {
    try DataProvider.write { _ in
      self.category = category
    }
  }

  public func update(title: String) throws {
    try DataProvider.write { _ in
      self.title = title
    }
  }

  public func update(notes: String) throws {
    try DataProvider.write { _ in
      self.notes = notes
    }
  }

  public func removeNotes() throws {
    try DataProvider.write { _ in
      self.notes = ""
    }
  }
}
