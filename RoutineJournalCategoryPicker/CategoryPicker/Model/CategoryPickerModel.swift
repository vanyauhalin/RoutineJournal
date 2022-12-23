import RoutineJournalCategorySelectionModifier
import RoutineJournalCore
import SwiftUI

public final class CategoryPickerModel:
  ObservableObject,
  MVICategorySelectionModifierModel
{
  public static let title = "Category"

  @Published
  public var showingExplorer = false

  public var categorySelection: Binding<CategoryObject?>

  public var category: CategoryObject? {
    categorySelection.wrappedValue
  }

  public init() {
    self.categorySelection = .constant(nil)
  }

  public func showExplorer() {
    showingExplorer = true
  }
}
