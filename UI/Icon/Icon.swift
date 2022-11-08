import RealmSwift

public enum IconName: String, PersistableEnum {
  case airplane = "airplane"
  case cart = "cart.fill"
}

public enum IconType: String, PersistableEnum {
  case custom
  case system
}

public class Icon: Object {
  @Persisted(primaryKey: true) public private(set) var _id: ObjectId
  @Persisted public private(set) var name: IconName
  @Persisted public private(set) var type: IconType

  public convenience init(name: IconName, type: IconType) {
    self.init()
    self.name = name
    self.type = type
  }
}
