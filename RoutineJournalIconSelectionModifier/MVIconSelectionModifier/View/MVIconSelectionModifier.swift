import RoutineJournalCore
import RoutineJournalMVI
import SwiftUI

public protocol MVIconSelectionModifier: MVView, IconSelectionModifier {}

extension MVIconSelectionModifier where Model: MVIconSelectionModifierModel {
  public func selection(_ icon: Binding<IconObject>) -> Self {
    let model = model.reinit(iconSelection: icon)
    return Self(model: model)
  }
}
