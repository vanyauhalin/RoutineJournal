import RoutineJournalMVI

public protocol SelectModifier: MVIIntent {
  var selectAction: () -> Void { get set }

  func reinit(model: Model, selectAction: @escaping () -> Void) -> Self
}

extension SelectModifier {
  public func reinit(model: Model, selectAction: @escaping () -> Void) -> Self {
    let intent = reinit(model: model)
    intent.selectAction = selectAction
    return intent
  }
}
