import RoutineJournalMVI

public protocol DeletionModifier: MVIIntent {
  var deletionAction: (() -> Void)? { get set }

  func reinit(model: Model, deletionAction: @escaping () -> Void) -> Self

  func onDelete()
}

extension DeletionModifier {
  public func reinit(
    model: Model,
    deletionAction: @escaping () -> Void
  ) -> Self {
    let intent = reinit(model: model)
    intent.deletionAction = deletionAction
    return intent
  }

  public func onDelete() {
    deletionAction?()
  }
}
