import RoutineJournalCore
import RoutineJournalMVI
import SwiftUI

extension MVView where Model: IconSelectionModifier {
  public func selection(_ icon: Binding<IconObject>) -> Self {
    let model = model.reinit(iconSelection: icon)
    return Self(model: model)
  }
}
