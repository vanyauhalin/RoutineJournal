#if DEBUG
import Foundation

extension EventObject {
  public static var mock1: EventObject {
    EventObject(
      category: .mock1,
      title: "Flight from London to Paris",
      notes: "Almost missed my flight",
      startDate: minutes(),
      endDate: minutes(80)
    )
  }
  public static var mock2: EventObject {
    EventObject(
      category: .mock2,
      title: "Shopping in an airport boutique",
      notes: "Finally I have this perfume",
      startDate: minutes(80 + 5),
      endDate: minutes(80 + 5 + 130)
    )
  }
  public static var mock3: EventObject {
    EventObject(
      category: .mock3,
      title: "Unknown event",
      notes: "Something unknown happened",
      startDate: minutes(80 + 5 + 130 + 20),
      endDate: minutes(80 + 5 + 130 + 20 + 10)
    )
  }

  private static func minutes(_ minutes: Int = .zero) -> Date {
    let now = Date.now
    return Calendar
      .current
      .date(byAdding: .minute, value: minutes, to: now)
      ?? now
  }
}
#endif
