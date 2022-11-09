import RealmSwift
import RoutineJournalCore

open class JCategoryItem: Object {
  @Persisted public private(set) var category: JCategory?
  @Persisted public private(set) var title: String
  @Persisted public private(set) var notes: String?

  public convenience init(
    category: JCategory,
    title: String,
    notes: String? = nil
  ) {
    self.init()
    self.category = category
    self.title = title
    self.notes = notes
  }

  public func update(category: JCategory) throws {
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
