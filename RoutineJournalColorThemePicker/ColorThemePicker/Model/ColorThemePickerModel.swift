import RoutineJournalColorThemeSelectionModifier
import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class ColorThemePickerModel: MVColorThemeSelectionModifierModel {
  public typealias Model = ColorThemePickerModel

  public let title = "Color Theme"
  public var colorThemeSelection: Binding<ColorTheme>

  public init() {
    self.colorThemeSelection = .constant(.default)
  }

  public init(colorThemeSelection: Binding<ColorTheme> = .constant(.default)) {
    self.colorThemeSelection = colorThemeSelection
  }
}
