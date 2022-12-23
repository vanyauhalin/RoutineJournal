import RoutineJournalCore
import RoutineJournalMVI

public protocol MVCategoryModifier: MVView, CategoryModifier {}

extension MVCategoryModifier where Model: MVCategoryModifierModel {
  public func category(_ category: CategoryObject?) -> Self {
    let model = model.reinit(category: category)
    return Self(model: model)
  }
}
