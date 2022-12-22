import RoutineJournalCore
import RoutineJournalMVI
import SwiftUI

public protocol MVIIconSelectionModifier: MVIView, IconSelectionModifier {}

extension MVIIconSelectionModifier where
  Model: MVIIconSelectionModifierModel,
  Intent: MVIIconSelectionModifierIntent,
  Intent.Model == Model
{
  public func selection(_ icon: Binding<IconObject>) -> Self {
    let model = model.reinit(iconSelection: icon)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
