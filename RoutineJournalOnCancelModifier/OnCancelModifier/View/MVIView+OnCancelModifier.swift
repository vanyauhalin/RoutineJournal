import RoutineJournalMVI

extension MVIView where Intent: OnCancelModifier, Intent.Model == Model {
  public func onCancel(perform action: @escaping () -> Void) -> Self {
    let intent = intent.reinit(model: model, actionOnCancel: action)
    return Self(model: model, intent: intent)
  }
}