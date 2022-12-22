import RoutineJournalCore

public protocol IconModifierModel: AnyObject {
  var icon: IconObject { get set }

  func reinit(icon: IconObject) -> Self
}

extension IconModifierModel {
  public func reinit(icon: IconObject) -> Self {
    self.icon = icon
    return self
  }
}
