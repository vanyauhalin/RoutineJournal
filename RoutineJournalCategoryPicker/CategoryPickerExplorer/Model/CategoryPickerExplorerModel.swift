import RoutineJournalCategorySelectionModifier
import RoutineJournalCore
import SwiftUI

public final class CategoryPickerExplorerModel:
  ObservableObject,
  CategorySelectionModifier
{
  public static let title = CategoryPickerModel.title

  @Published
  public var query = String.default

  public var categorySelection: Binding<CategoryObject?>

  public init() {
    self.categorySelection = .constant(nil)
  }
}
