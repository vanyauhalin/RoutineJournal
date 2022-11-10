import Foundation
import RealmSwift
import RoutineJournalCore
import RoutineJournalJCategory

public struct JEventConfiguration: ObjectConfiguration {
  public typealias Object = JEvent

  public static let schemaVersion: UInt64 = 0
  public static func migrationBlock(
    migration: Migration,
    oldSchemaVersion: UInt64
  ) {}

  public static func exampleData() -> [Object] {
    do {
      var data: [JEvent] = []
      let categories = try DataProvider.realm().objects(JCategory.self)
      var lastDate = Date.now

      if
        let flightsCategory = categories.first(where: { category in
          category.title == "Flights"
        }),
        let endDate = Calendar.current.date(
          byAdding: .minute,
          value: 80,
          to: lastDate
        )
      {
        data.append(JEvent(
          category: flightsCategory,
          title: "Flight from London to Paris",
          notes: "Almost missed my flight",
          startDate: lastDate,
          endDate: endDate
        ))
        lastDate = endDate
      }

      if
        let shoppingTripCategory = categories.first(where: { category in
          category.title == "Shopping trip"
        }),
        let startDate = Calendar.current.date(
          byAdding: .minute,
          value: 5,
          to: lastDate
        ),
        let endDate = Calendar.current.date(
          byAdding: .minute,
          value: 130,
          to: startDate
        )
      {
        data.append(JEvent(
          category: shoppingTripCategory,
          title: "Shopping in an airport boutique",
          notes: "Finally I have this perfume",
          startDate: startDate,
          endDate: endDate
        ))
        lastDate = endDate
      }

      return data
    } catch {
      return []
    }
  }
}
