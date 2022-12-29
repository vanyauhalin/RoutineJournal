import Combine
import RealmSwift
import RoutineJournalCore

public final class CategoriesLinkModel: ObservableObject {
  public static let title = "Categories"

  private var subscriptions = Set<AnyCancellable>()

  @Published
  public var categories: Results<CategoryObject>?

  public init() {
    self.categories = CategoryObject.objects()
    self.subscribe()
  }

  private func subscribe() {
    categories?
      .objectWillChange
      .sink { [weak self] _ in
        self?.objectWillChange.send()
      }
      .store(in: &subscriptions)
  }
}
