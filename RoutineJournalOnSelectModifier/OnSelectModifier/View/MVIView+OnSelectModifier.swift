import RoutineJournalMVI

extension MVIView where Intent: OnSelectModifier, Intent.Model == Model {
  public func onSelect(perform action: @escaping () -> Void) -> Self {
    let intent = intent.reinit(model: model, actionOnSelect: action)
    return Self(model: model, intent: intent)
  }
}
