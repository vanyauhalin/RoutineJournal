import RoutineJournalMVI
import SwiftUI

public protocol ToolbarContentStyle {
  associatedtype Body2: ToolbarContent
  associatedtype Content

  var content: Content { get set }

  func body(content: Content) -> Body2
}
