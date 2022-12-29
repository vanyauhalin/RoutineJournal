import RoutineJournalMVI

public protocol CancellationModifier: MVIIntent {
  var cancellationAction: (() -> Void)? { get set }

  func reinit(model: Model, cancellationAction: @escaping () -> Void) -> Self

  func onCancel()
}

extension CancellationModifier {
  public func reinit(
    model: Model,
    cancellationAction: @escaping () -> Void
  ) -> Self {
    let intent = reinit(model: model)
    intent.cancellationAction = cancellationAction
    return intent
  }

  public func onCancel() {
    cancellationAction?()
  }
}
