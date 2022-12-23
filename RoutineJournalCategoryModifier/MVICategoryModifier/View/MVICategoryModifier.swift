import RoutineJournalCore
import RoutineJournalMVI

public protocol MVICategoryModifier: MVIView, CategoryModifier {}

extension MVICategoryModifier where
  Model: MVICategoryModifierModel,
  Intent: MVICategoryModifierIntent,
  Intent.Model == Model
{
  public func category(_ category: CategoryObject?) -> Self {
    let model = model.reinit(category: category)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
