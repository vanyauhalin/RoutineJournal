import RealmSwift

public final class CategoryObject: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) public var _id: ObjectId
  @Persisted public var title = ""
  @Persisted public var icon: IconObject?
  @Persisted public var colorTheme = ColorTheme.neutral

  public convenience init(
    title: String,
    icon: IconObject,
    colorTheme: ColorTheme
  ) {
    self.init()
    self.title = title
    self.icon = icon
    self.colorTheme = colorTheme
  }

  public func update(title: String) throws {
    try DataProvider.write { _ in
      self.title = title
    }
  }

  public func select(icon: IconObject) throws {
    try DataProvider.write { _ in
      self.icon = icon
    }
  }

  public func select(colorTheme: ColorTheme) throws {
    try DataProvider.write { _ in
      self.colorTheme = colorTheme
    }
  }
}
