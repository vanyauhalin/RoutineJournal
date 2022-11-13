import RealmSwift
import RoutineJournalCore
import RoutineJournalUI

public class Category: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) public private(set) var _id: ObjectId
  @Persisted public private(set) var title: String
  @Persisted public private(set) var icon: Icon?
  @Persisted public private(set) var colorTheme: ColorTheme

  public convenience init(title: String, icon: Icon, colorTheme: ColorTheme) {
    self.init()
    self.title = title
    self.icon = icon
    self.colorTheme = colorTheme
  }

  public func update(title: String) throws {
    return try DataProvider.write { _ in
      self.title = title
    }
  }

  public func select(icon: Icon) throws {
    return try DataProvider.write { _ in
      self.icon = icon
    }
  }

  public func select(colorTheme: ColorTheme) throws {
    return try DataProvider.write { _ in
      self.colorTheme = colorTheme
    }
  }
}
