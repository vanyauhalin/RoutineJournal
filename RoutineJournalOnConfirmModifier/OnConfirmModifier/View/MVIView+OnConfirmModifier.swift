import RoutineJournalMVI

extension MVIView where Intent: OnConfirmModifier, Intent.Model == Model {
  public func onConfirm(perform action: @escaping () -> Void) -> Self {
    let intent = intent.reinit(model: model, actionOnConfirm: action)
    return Self(model: model, intent: intent)
  }
}
