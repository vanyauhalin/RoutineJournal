import RealmSwift
import RoutineJournalCore
import RoutineJournalUI

public struct JCategoryConfiguration: ObjectConfiguration {
  public typealias Object = JCategory

  public static let schemaVersion: UInt64 = 0
  public static func migrationBlock(
    migration: Migration,
    oldSchemaVersion: UInt64
  ) {}

  public static func exampleData() -> [JCategory] {
    do {
      var data: [JCategory] = []
      let icons = try DataProvider.realm().objects(Icon.self)

      if
        let airplaneIcon = icons.first(where: { icon in
          icon.name == .airplane
        })
      {
        data.append(JCategory(
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
        data.append(JCategory(
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
