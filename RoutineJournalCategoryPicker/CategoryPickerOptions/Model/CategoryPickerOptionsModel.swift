import Combine
import RealmSwift
import RoutineJournalCategorySelectionModifier
import RoutineJournalCore
import RoutineJournalQueryModifier
import SwiftUI

public final class CategoryPickerOptionsModel:
  ObservableObject,
  MVICategorySelectionModifierModel,
  QueryModifier
{
  private var subscriptions = Set<AnyCancellable>()

  @Published
  public var categories: Results<CategoryObject>?
  public var categorySelection: Binding<CategoryObject?>
  public var query: Binding<String>

  public init() {
    self.categories = CategoryObject.objects()
    self.categorySelection = .constant(nil)
    self.query = .constant(.default)
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
