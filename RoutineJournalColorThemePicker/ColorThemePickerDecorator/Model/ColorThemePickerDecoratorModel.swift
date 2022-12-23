import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalUI

public final class ColorThemePickerDecoratorModel: MVColorThemeModifierModel {
  public typealias Model = ColorThemePickerDecoratorModel

  public static let width: Double = 11

  public var colorTheme: ColorTheme
  public var colors: Colors

  public init() {
    let colorTheme = ColorTheme.default
    self.colorTheme = colorTheme
    self.colors = Model.colors(by: colorTheme)
  }

  public init(colorTheme: ColorTheme = .default) {
    self.colorTheme = colorTheme
    self.colors = Model.colors(by: colorTheme)
  }

  public static func colors(by colorTheme: ColorTheme) -> Colors {
    Colors.create(from: colorTheme) { palette in
      Colors(foregroundColor: palette.color600)
    }
  }
}
