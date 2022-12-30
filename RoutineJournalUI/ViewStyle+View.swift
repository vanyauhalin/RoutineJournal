import RoutineJournalFoundation
import SwiftUI

extension ViewStyle where Self: Initializable, Self: View {
  public init(content: Content) {
    self.init()
    self.content = content
  }

  public func body(content: Content) -> some View {
    Self(content: content)
  }
}
