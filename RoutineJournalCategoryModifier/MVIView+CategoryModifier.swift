import RoutineJournalCore
import RoutineJournalMVI

extension MVIView where Model: CategoryModifier, Intent.Model == Model {
  public func category(_ category: CategoryObject?) -> Self {
    let model = model.reinit(category: category)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
