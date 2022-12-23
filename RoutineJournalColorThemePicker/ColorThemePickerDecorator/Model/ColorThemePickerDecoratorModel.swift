import RoutineJournalCore
import RoutineJournalUI

public final class ColorThemePickerDecoratorModel {
  public typealias Model = ColorThemePickerDecoratorModel

  public static let width: Double = 11

  public let colorTheme: ColorTheme
  public var colors: Colors

  public init(colorTheme: ColorTheme = .default) {
    self.colorTheme = colorTheme
    self.colors = Model.colors(by: colorTheme)
  }

  public static func colors(by colorTheme: ColorTheme) -> Colors {
    Colors.create(from: colorTheme) { palette in
      Colors(foregroundColor: palette.color600)
    }
  }

  public func reinit(colorTheme: ColorTheme? = nil) -> Model {
    Model(colorTheme: colorTheme ?? self.colorTheme)
  }
}
