import RoutineJournalCore
import SwiftUI

public protocol CategorySelectionModifier {
  func selection(_ category: Binding<CategoryObject?>) -> Self
}
