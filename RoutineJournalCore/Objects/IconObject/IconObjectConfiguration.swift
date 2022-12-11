public struct IconObjectConfiguration: ObjectConfiguration {
  public typealias Object = IconObject

  public static func examples() -> [IconObject] {
    [
      IconObject(name: .airplane, type: .system),
      IconObject(name: .cart, type: .system),
      IconObject(name: .questionmark, type: .system)
    ]
  }
}
