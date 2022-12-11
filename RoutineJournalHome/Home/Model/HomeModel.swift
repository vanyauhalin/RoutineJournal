import Combine
import Foundation
import RealmSwift
import RoutineJournalCore

public final class HomeModel: ObservableObject {
  public static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d"
    return formatter
  }()

  public let date: Date
  @Published public var plus: Bool
  @Published public var objects: Results<EventObject>?
  var objectsCancellable: AnyCancellable?

  public var string: String {
    HomeModel.formatter.string(from: date)
  }

  public init(date: Date, plus: Bool = false) {
    self.date = date
    self.plus = plus
    self.objects = try? DataProvider.realm().objects(EventObject.self)
    objectsCancellable = objects?.objectWillChange.sink { [weak self] _ in
      self?.objectWillChange.send()
    }
  }
}
