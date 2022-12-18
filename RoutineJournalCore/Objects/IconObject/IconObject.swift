import RealmSwift

public enum IconName: String, PersistableEnum {
  case airplane = "airplane"
  case cart = "cart.fill"
  case questionmark = "questionmark"
}

public enum IconType: String, PersistableEnum {
  case custom
  case system
}

public final class IconObject: Object, ObjectKeyIdentifiable {
  public static var `default`: IconObject {
    let object = try? DataProvider
      .realm()
      .objects(IconObject.self)
      .first { object in
        object.name == .questionmark && object.type == .system
      }
    return object ?? IconObject(name: .questionmark, type: .system)
  }

  @Persisted(primaryKey: true) public var _id: ObjectId
  @Persisted public var name = IconName.questionmark
  @Persisted public var type = IconType.system

  public convenience init(name: IconName, type: IconType) {
    self.init()
    self.name = name
    self.type = type
  }
}
