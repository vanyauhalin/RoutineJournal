import RoutineJournalFoundation
import RoutineJournalTextModifier
import SwiftUI

public final class NameFieldModel: TextModifier {
  public static let title = "Name"

  public var text: Binding<String>

  public init() {
    self.text = .constant(.default)
  }
}
