import RoutineJournalCore
import RoutineJournalUI

public final class ColorThemePickerDecoratorModel {
  public typealias Model = ColorThemePickerDecoratorModel

  public let colorTheme: ColorTheme
  public var colors: Colors
  public let size: Size

  public init(
    colorTheme: ColorTheme = .default,
    size: Size = .default
  ) {
    self.colorTheme = colorTheme
    self.colors = Model.colors(by: colorTheme)
    self.size = size
  }

  public static func colors(by colorTheme: ColorTheme) -> Colors {
    Colors.create(from: colorTheme) { palette in
      Colors(foregroundColor: palette.color600)
    }
  }

  public func reinit(
    colorTheme: ColorTheme? = nil,
    size: Size? = nil
  ) -> Model {
    Model(
      colorTheme: colorTheme ?? self.colorTheme,
      size: size ?? self.size
    )
  }
}
