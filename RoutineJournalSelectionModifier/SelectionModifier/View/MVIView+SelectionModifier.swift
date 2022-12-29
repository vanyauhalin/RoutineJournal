import RoutineJournalMVI

extension MVIView where Intent: SelectionModifier, Intent.Model == Model {
  public func onSelect(perform action: @escaping () -> Void) -> Self {
    let intent = intent.reinit(model: model, selectionAction: action)
    return Self(model: model, intent: intent)
  }
}
