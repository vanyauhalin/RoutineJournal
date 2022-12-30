import RoutineJournalColorThemeModifier
import RoutineJournalCore

public final class ColorThemePickerOptionModel: ColorThemeModifier {
  public static let destinationSpacing: Double = 16
  public static let labelSpacing: Double = 10

  public var colorTheme: ColorTheme

  public init() {
    self.colorTheme = .default
  }
}
