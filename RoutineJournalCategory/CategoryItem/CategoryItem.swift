import RealmSwift
import RoutineJournalCore

open class CategoryItem: Object, ObjectKeyIdentifiable {
  @Persisted public private(set) var category: Category?
  @Persisted public private(set) var title: String
  @Persisted public private(set) var notes: String?

  public convenience init(
    category: Category,
    title: String,
    notes: String? = nil
  ) {
    self.init()
    self.category = category
    self.title = title
    self.notes = notes
  }

  public func update(category: Category) throws {
    return try DataProvider.write { _ in
      self.category = category
    }
  }

  public func update(title: String) throws {
    return try DataProvider.write { _ in
      self.title = title
    }
  }

  public func update(notes: String) throws {
    return try DataProvider.write { _ in
      self.notes = notes
    }
  }

  public func removeNotes() throws {
    return try DataProvider.write { _ in
      self.notes = nil
    }
  }
}
