import RoutineJournalMVI

public protocol ConfirmationModifier: MVIIntent {
  var actionOnConfirm: (() -> Void)? { get set }

  func reinit(model: Model, actionOnConfirm: @escaping () -> Void) -> Self

  func onConfirm()
}

extension ConfirmationModifier {
  public func reinit(
    model: Model,
    actionOnConfirm: @escaping () -> Void
  ) -> Self {
    let intent = reinit(model: model)
    intent.actionOnConfirm = actionOnConfirm
    return intent
  }

  public func onConfirm() {
    actionOnConfirm?()
  }
}
