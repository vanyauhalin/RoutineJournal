import RoutineJournalColorThemeSelectionModifier
import RoutineJournalCore
import SwiftUI

public final class ColorThemePickerModel: ColorThemeSelectionModifier {
  public static let title = "Color Theme"

  public var colorThemeSelection: Binding<ColorTheme>

  public init() {
    self.colorThemeSelection = .constant(.default)
  }
}
