import RoutineJournalCore

public protocol CategoryModifierModel: AnyObject {
  var category: CategoryObject? { get set }

  func reinit(category: CategoryObject?) -> Self
}

extension CategoryModifierModel {
  public func reinit(category: CategoryObject?) -> Self {
    self.category = category
    return self
  }
}
