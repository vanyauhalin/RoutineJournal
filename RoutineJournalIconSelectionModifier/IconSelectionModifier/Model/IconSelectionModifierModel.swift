import RoutineJournalCore
import SwiftUI

public protocol IconSelectionModifierModel: AnyObject {
  var iconSelection: Binding<IconObject> { get set }

  func reinit(iconSelection: Binding<IconObject>) -> Self
}

extension IconSelectionModifierModel {
  public func reinit(iconSelection: Binding<IconObject>) -> Self {
    self.iconSelection = iconSelection
    return self
  }
}
