import RoutineJournalFoundation
import SwiftUI

extension ToolbarContentStyle where Self: Initializable, Self: ToolbarContent {
  public init(content: Content) {
    self.init()
    self.content = content
  }

  public func body(content: Content) -> some ToolbarContent {
    Self(content: content)
  }
}
