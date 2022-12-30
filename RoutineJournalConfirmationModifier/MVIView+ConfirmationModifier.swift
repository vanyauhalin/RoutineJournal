import RoutineJournalMVI

extension MVIView where Intent: ConfirmationModifier, Intent.Model == Model {
  public func onConfirm(perform action: @escaping () -> Void) -> Self {
    let intent = intent.reinit(model: model, confirmationAction: action)
    return Self(model: model, intent: intent)
  }
}
