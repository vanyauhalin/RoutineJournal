import RoutineJournalMVI

extension MVIView where Intent: SelectModifier, Intent.Model == Model {
  public func onSelect(perform action: @escaping () -> Void) -> Self {
    let intent = intent.reinit(model: model, selectAction: action)
    return Self(model: model, intent: intent)
  }
}
