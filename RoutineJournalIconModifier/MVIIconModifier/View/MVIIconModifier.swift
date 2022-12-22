import RoutineJournalCore
import RoutineJournalMVI

public protocol MVIIconModifier: MVIView, IconModifier {}

extension MVIIconModifier where
  Model: MVIIconModifierModel,
  Intent: MVIIconModifierIntent,
  Intent.Model == Model
{
  public func icon(_ icon: IconObject) -> Self {
    let model = model.reinit(icon: icon)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
