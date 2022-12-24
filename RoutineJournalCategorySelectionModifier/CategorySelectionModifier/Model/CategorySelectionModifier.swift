import RoutineJournalCore
import SwiftUI

public protocol CategorySelectionModifier: AnyObject {
  var categorySelection: Binding<CategoryObject?> { get set }

  func reinit(categorySelection: Binding<CategoryObject?>) -> Self
}

extension CategorySelectionModifier {
  public func reinit(categorySelection: Binding<CategoryObject?>) -> Self {
    self.categorySelection = categorySelection
    return self
  }
}
