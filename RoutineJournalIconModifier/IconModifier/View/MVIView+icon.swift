import RoutineJournalCore
import RoutineJournalMVI

extension MVIView where Model: IconModifier, Intent.Model == Model {
  public func icon(_ icon: IconObject) -> Self {
    let model = model.reinit(icon: icon)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
