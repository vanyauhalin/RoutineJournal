import RoutineJournalColorThemeSelectionModifier
import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class ColorThemePickerModel: MVColorThemeSelectionModifierModel {
  public static let title = "Color Theme"

  public var colorThemeSelection: Binding<ColorTheme>

  public init() {
    self.colorThemeSelection = .constant(.default)
  }
}
