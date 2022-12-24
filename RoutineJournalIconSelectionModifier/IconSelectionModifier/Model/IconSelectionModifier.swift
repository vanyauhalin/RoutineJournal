import RoutineJournalCore
import SwiftUI

public protocol IconSelectionModifier: AnyObject {
  var iconSelection: Binding<IconObject> { get set }

  func reinit(iconSelection: Binding<IconObject>) -> Self
}

extension IconSelectionModifier {
  public func reinit(iconSelection: Binding<IconObject>) -> Self {
    self.iconSelection = iconSelection
    return self
  }
}
