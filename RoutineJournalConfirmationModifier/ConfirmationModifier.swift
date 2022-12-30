import RoutineJournalMVI

public protocol ConfirmationModifier: MVIIntent {
  var confirmationAction: (() -> Void)? { get set }

  func reinit(model: Model, confirmationAction: @escaping () -> Void) -> Self

  func onConfirm()
}

extension ConfirmationModifier {
  public func reinit(
    model: Model,
    confirmationAction: @escaping () -> Void
  ) -> Self {
    let intent = reinit(model: model)
    intent.confirmationAction = confirmationAction
    return intent
  }

  public func onConfirm() {
    confirmationAction?()
  }
}
