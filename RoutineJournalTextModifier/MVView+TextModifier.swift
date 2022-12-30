import RoutineJournalMVI
import SwiftUI

extension MVView where Model: TextModifier {
  public func text(_ text: Binding<String>) -> Self {
    let model = model.reinit(text: text)
    return Self(model: model)
  }
}
