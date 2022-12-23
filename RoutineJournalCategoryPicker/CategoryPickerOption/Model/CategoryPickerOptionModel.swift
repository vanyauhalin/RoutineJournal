import RoutineJournalCategoryModifier
import RoutineJournalCategorySelectionModifier
import RoutineJournalSelectModifier
import RoutineJournalCore
import SwiftUI

public final class CategoryPickerOptionModel:
  MVICategoryModifierModel,
  MVICategorySelectionModifierModel,
  MVISelectModifierModel
{
  public var category: CategoryObject?
  public var categorySelection: Binding<CategoryObject?>

  public var categorySelected: Bool {
    category == categorySelection.wrappedValue
  }

  public init() {
    self.categorySelection = .constant(nil)
  }

  public func select() {
    categorySelection.wrappedValue = category
  }
}
