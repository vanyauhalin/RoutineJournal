import Foundation

public struct EventObjectConfiguration: ObjectConfiguration {
  public typealias Object = EventObject

  struct Template {
    var categoryTitle: String
    var title: String
    var notes: String
    var startDate: Date?
    var endDate: Date?
  }

  public static func examples() -> [EventObject] {
    let now = Date.now
    let categories = try? DataProvider.realm().objects(CategoryObject.self)
    return [
      Template(
        categoryTitle: "Flights",
        title: "Flight from London to Paris",
        notes: "Almost missed my flight",
        startDate: now,
        endDate: Calendar.current.date(
          byAdding: .minute,
          value: 80,
          to: now
        )
      ),
      Template(
        categoryTitle: "Shopping trip",
        title: "Shopping in an airport boutique",
        notes: "Finally I have this perfume",
        startDate: Calendar.current.date(
          byAdding: .minute,
          value: 80 + 5,
          to: now
        ),
        endDate: Calendar.current.date(
          byAdding: .minute,
          value: 80 + 5 + 130,
          to: now
        )
      )
    ]
      .compactMap { item in
        guard
          let category = categories?.first(where: { category in
            category.title == item.categoryTitle
          }),
          let startDate = item.startDate,
          let endDate = item.endDate
        else {
          return nil
        }
        return EventObject(
          category: category,
          title: item.title,
          notes: item.notes,
          startDate: startDate,
          endDate: endDate
        )
      }
  }
}
