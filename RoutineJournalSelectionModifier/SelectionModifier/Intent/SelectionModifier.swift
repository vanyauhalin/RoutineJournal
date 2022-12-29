import RoutineJournalMVI

public protocol SelectionModifier: MVIIntent {
  var actionOnSelect: (() -> Void)? { get set }

  func reinit(model: Model, actionOnSelect: @escaping () -> Void) -> Self

  func onSelect()
}

extension SelectionModifier {
  public func reinit(
    model: Model,
    actionOnSelect: @escaping () -> Void
  ) -> Self {
    let intent = reinit(model: model)
    intent.actionOnSelect = actionOnSelect
    return intent
  }

  public func onSelect() {
    actionOnSelect?()
  }
}
