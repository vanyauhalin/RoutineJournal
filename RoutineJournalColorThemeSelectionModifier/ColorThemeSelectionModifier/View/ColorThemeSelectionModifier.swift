import RoutineJournalCore
import SwiftUI

public protocol ColorThemeSelectionModifier {
  func selection(_ colorTheme: Binding<ColorTheme>) -> Self
}
