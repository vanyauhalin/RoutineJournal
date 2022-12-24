import RoutineJournalCore
import RoutineJournalMVI
import SwiftUI

extension MVIView where
  Model: CategorySelectionModifier,
  Intent.Model == Model
{
  public func selection(_ category: Binding<CategoryObject?>) -> Self {
    let model = model.reinit(categorySelection: category)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
