public struct CategoryObjectConfiguration: ObjectConfiguration {
  public typealias Object = CategoryObject

  struct Template {
    var title: String
    var iconName: IconName
    var colorTheme: ColorTheme
  }

  public static func examples() -> [CategoryObject] {
    let icons = try? DataProvider.realm().objects(IconObject.self)
    return [
      Template(title: "Flights", iconName: .airplane, colorTheme: .indigo),
      Template(title: "Shopping trip", iconName: .cart, colorTheme: .rose)
    ]
      .compactMap { item in
        guard
          let icon = icons?.first(where: { icon in
            icon.name == item.iconName
          })
        else {
          return nil
        }
        return CategoryObject(
          title: item.title,
          icon: icon,
          colorTheme: item.colorTheme
        )
      }
  }
}
