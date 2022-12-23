import RoutineJournalCore
import SwiftUI

public protocol CategorySelectionModifierModel: AnyObject {
  var categorySelection: Binding<CategoryObject?> { get set }

  func reinit(categorySelection: Binding<CategoryObject?>) -> Self
}

extension CategorySelectionModifierModel {
  public func reinit(categorySelection: Binding<CategoryObject?>) -> Self {
    self.categorySelection = categorySelection
    return self
  }
}
