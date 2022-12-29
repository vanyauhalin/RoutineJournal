import RoutineJournalMVI
import SwiftUI

extension ViewStyle where Self: MVView {
  public init(model: Model, content: Content) {
    self.init()
    self.model = model
    self.content = content
  }

  public func body(content: Content) -> some View {
    Self(model: model, content: content)
  }
}
