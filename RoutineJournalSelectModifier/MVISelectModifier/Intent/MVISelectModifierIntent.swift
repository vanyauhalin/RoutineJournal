import RoutineJournalMVI

public protocol MVISelectModifierIntent: MVIIntent {
  var selectAction: () -> Void { get set }

  func reinit(model: Model, selectAction: () -> Void) -> Self
}

extension MVISelectModifierIntent {
  public func reinit(model: Model, selectAction: @escaping () -> Void) -> Self {
    let intent = reinit(model: model)
    intent.selectAction = selectAction
    return intent
  }
}
