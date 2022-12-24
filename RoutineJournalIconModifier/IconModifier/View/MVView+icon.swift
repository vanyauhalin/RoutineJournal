import RoutineJournalCore
import RoutineJournalMVI

extension MVView where Model: IconModifier {
  public func icon(_ icon: IconObject) -> Self {
    let model = model.reinit(icon: icon)
    return Self(model: model)
  }
}
