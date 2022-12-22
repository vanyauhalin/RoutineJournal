import RoutineJournalCore
import SwiftUI

public protocol IconSelectionModifier {
  func selection(_ icon: Binding<IconObject>) -> Self
}
