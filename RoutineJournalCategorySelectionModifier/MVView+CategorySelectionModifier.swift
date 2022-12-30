import RoutineJournalCore
import RoutineJournalMVI
import SwiftUI

extension MVView where Model: CategorySelectionModifier {
  public func selection(_ category: Binding<CategoryObject?>) -> Self {
    let model = model.reinit(categorySelection: category)
    return Self(model: model)
  }
}
