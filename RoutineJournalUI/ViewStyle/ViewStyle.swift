import RoutineJournalMVI
import SwiftUI

public protocol ViewStyle {
  associatedtype Body2: View
  associatedtype Content

  var content: Content { get set }

  func body(content: Content) -> Body2
}
