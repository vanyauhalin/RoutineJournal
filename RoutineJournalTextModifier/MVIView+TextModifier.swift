import RoutineJournalMVI
import SwiftUI

extension MVIView where Model: TextModifier, Intent.Model == Model {
  public func text(_ text: Binding<String>) -> Self {
    let model = model.reinit(text: text)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
