import RoutineJournalCore

public protocol IconModifier: AnyObject {
  var icon: IconObject { get set }

  func reinit(icon: IconObject) -> Self
}

extension IconModifier {
  public func reinit(icon: IconObject) -> Self {
    self.icon = icon
    return self
  }
}
