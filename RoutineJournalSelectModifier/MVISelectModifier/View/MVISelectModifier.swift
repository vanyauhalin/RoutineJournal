import RoutineJournalMVI

public protocol MVISelectModifier: MVIView, SelectModifier {}

extension MVISelectModifier where
  Model: MVISelectModifierModel,
  Intent: MVISelectModifierIntent,
  Intent.Model == Model
{
  public func onSelect(perform action: @escaping () -> Void) -> Self {
    let intent = intent.reinit(model: model, selectAction: action)
    return Self(model: model, intent: intent)
  }
}
