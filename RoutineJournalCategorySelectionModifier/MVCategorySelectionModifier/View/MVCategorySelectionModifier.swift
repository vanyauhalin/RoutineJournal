import RoutineJournalCore
import RoutineJournalMVI
import SwiftUI

public protocol MVCategorySelectionModifier:
  MVView,
  CategorySelectionModifier
{}

extension MVCategorySelectionModifier where
  Model: MVCategorySelectionModifierModel
{
  public func selection(_ category: Binding<CategoryObject?>) -> Self {
    let model = model.reinit(categorySelection: category)
    return Self(model: model)
  }
}
