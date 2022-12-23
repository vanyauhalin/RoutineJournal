import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalUI

public final class ColorThemePickerOptionModel: MVColorThemeModifierModel {
  public static let destinationSpacing: Double = 16
  public static let labelSpacing: Double = 10

  public var colorTheme: ColorTheme

  public init() {
    self.colorTheme = .default
  }
}
