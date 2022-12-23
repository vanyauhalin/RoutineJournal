import RoutineJournalColorThemeSelectionModifier
import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class ColorThemePickerModel: MVColorThemeSelectionModifierModel {
  public typealias Model = ColorThemePickerModel

  public static let title = "Color Theme"

  public var colorThemeSelection: Binding<ColorTheme>

  public init() {
    self.colorThemeSelection = .constant(.default)
  }
}
