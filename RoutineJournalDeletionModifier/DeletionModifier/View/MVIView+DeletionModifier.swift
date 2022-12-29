import RoutineJournalMVI

extension MVIView where Intent: DeletionModifier, Intent.Model == Model {
  public func onDelete(perform action: @escaping () -> Void) -> Self {
    let intent = intent.reinit(model: model, deletionAction: action)
    return Self(model: model, intent: intent)
  }
}
