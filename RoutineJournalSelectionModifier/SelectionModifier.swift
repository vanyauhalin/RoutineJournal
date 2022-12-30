import RoutineJournalMVI

public protocol SelectionModifier: MVIIntent {
  var selectionAction: (() -> Void)? { get set }

  func reinit(model: Model, selectionAction: @escaping () -> Void) -> Self

  func onSelect()
}

extension SelectionModifier {
  public func reinit(
    model: Model,
    selectionAction: @escaping () -> Void
  ) -> Self {
    let intent = reinit(model: model)
    intent.selectionAction = selectionAction
    return intent
  }

  public func onSelect() {
    selectionAction?()
  }
}
