import RoutineJournalCore
import RoutineJournalMVI

extension MVView where Model: CategoryModifier {
  public func category(_ category: CategoryObject?) -> Self {
    let model = model.reinit(category: category)
    return Self(model: model)
  }
}
