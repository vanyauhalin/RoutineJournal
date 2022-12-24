import RoutineJournalMVI
import SwiftUI

extension MVIView where Model: QueryModifier, Intent.Model == Model {
  public func query(_ query: Binding<String>) -> Self {
    let model = model.reinit(query: query)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
