import RoutineJournalCore
import RoutineJournalMVI

public protocol MVIconModifier: MVView, IconModifier {}

extension MVIconModifier where Model: MVIconModifierModel {
  public func icon(_ icon: IconObject) -> Self {
    let model = model.reinit(icon: icon)
    return Self(model: model)
  }
}
