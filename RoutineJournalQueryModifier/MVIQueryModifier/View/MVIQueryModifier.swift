import RoutineJournalMVI
import SwiftUI

public protocol MVIQueryModifier: MVIView, QueryModifier {}

extension MVIQueryModifier where
  Model: MVIQueryModifierModel,
  Intent: MVIQueryModifierIntent,
  Intent.Model == Model
{
  public func query(_ query: Binding<String>) -> Self {
    let model = model.reinit(query: query)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
