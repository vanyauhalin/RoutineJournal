import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalUI

public final class ColorThemePickerOptionModel: MVColorThemeModifierModel {
  public typealias Model = ColorThemePickerOptionModel

  public static let destinationSpacing: Double = 16
  public static let labelSpacing: Double = 10

  public var colorTheme: ColorTheme

  public init() {
    self.colorTheme = .default
  }

  public init(colorTheme: ColorTheme = .default) {
    self.colorTheme = colorTheme
  }

  public func reinit(colorTheme: ColorTheme? = nil) -> Model {
    Model(colorTheme: colorTheme ?? self.colorTheme)
  }
}
