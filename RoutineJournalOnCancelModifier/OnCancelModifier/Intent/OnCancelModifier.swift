import RoutineJournalMVI

public protocol OnCancelModifier: MVIIntent {
  var actionOnCancel: () -> Void { get set }

  func reinit(model: Model, actionOnCancel: @escaping () -> Void) -> Self

  func onCancel()
}

extension OnCancelModifier {
  public func reinit(
    model: Model,
    actionOnCancel: @escaping () -> Void
  ) -> Self {
    let intent = reinit(model: model)
    intent.actionOnCancel = actionOnCancel
    return intent
  }

  public func onCancel() {
    actionOnCancel()
  }
}
