import RealmSwift
import RoutineJournalCore
import RoutineJournalUI

public struct CategoryConfiguration: ObjectConfiguration {
  public typealias Object = Category

  public static let schemaVersion: UInt64 = 0
  public static func migrationBlock(
    migration: Migration,
    oldSchemaVersion: UInt64
  ) {}

  public static func exampleData() -> [Category] {
    do {
      var data: [Category] = []
      let icons = try DataProvider.realm().objects(Icon.self)

      if
        let airplaneIcon = icons.first(where: { icon in
          icon.name == .airplane
        })
      {
        data.append(Category(
          title: "Flights",
          icon: airplaneIcon,
          colorTheme: .indigo
        ))
      }

      if
        let cartIcon = icons.first(where: { icon in
          icon.name == .cart
        })
      {
        data.append(Category(
          title: "Shopping trip",
          icon: cartIcon,
          colorTheme: .rose
        ))
      }

      return data
    } catch {
      return []
    }
  }
}
