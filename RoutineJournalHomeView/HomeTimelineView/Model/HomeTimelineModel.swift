import Combine
// import Foundation
import RealmSwift
import RoutineJournalCore

public final class HomeTimelineModel: ObservableObject {
  private var subscriptions = Set<AnyCancellable>()

  @Published public var events: Results<EventObject>?

  public init() {
    self.events = EventObject.objects()
    self.subscribe()
  }

  private func subscribe() {
    events?
      .objectWillChange
      .sink { [weak self] _ in
        self?.objectWillChange.send()
      }
      .store(in: &subscriptions)
  }
}
