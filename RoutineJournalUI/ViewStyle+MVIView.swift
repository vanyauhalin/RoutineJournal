import RoutineJournalMVI
import SwiftUI

extension ViewStyle where Self: MVIView {
  public init(model: Model, intent: Intent, content: Content) {
    self.init()
    self.model = model
    self.intent = intent
    self.content = content
  }

  public func body(content: Content) -> some View {
    Self(model: model, intent: intent, content: content)
  }
}
