import RoutineJournalMVI

extension MVIView where Intent: CancellationModifier, Intent.Model == Model {
  public func onCancel(perform action: @escaping () -> Void) -> Self {
    let intent = intent.reinit(model: model, cancellationAction: action)
    return Self(model: model, intent: intent)
  }
}
