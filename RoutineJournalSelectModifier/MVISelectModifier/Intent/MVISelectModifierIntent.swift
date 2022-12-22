import RoutineJournalMVI

public protocol MVISelectModifierIntent: MVIIntent {
  var selectAction: () -> Void { get set }

  func reinit(model: Model, selectAction: @escaping () -> Void) -> Self
}

extension MVISelectModifierIntent where Model: MVISelectModifierModel {
  public func reinit(model: Model, selectAction: @escaping () -> Void) -> Self {
    let intent = reinit(model: model)
    intent.selectAction = selectAction
    return intent
  }
}
