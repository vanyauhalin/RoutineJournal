import RoutineJournalCore

public protocol CategoryModifier: AnyObject {
  var category: CategoryObject? { get set }

  func reinit(category: CategoryObject?) -> Self
}

extension CategoryModifier {
  public func reinit(category: CategoryObject?) -> Self {
    self.category = category
    return self
  }
}
