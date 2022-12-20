import RoutineJournalCore
import RoutineJournalUI

public final class ColorThemePickerOptionModel {
  public typealias Model = ColorThemePickerOptionModel

  public let colorTheme: ColorTheme
  public let size: Size

  public init(
    colorTheme: ColorTheme = .default,
    size: Size = .default
  ) {
    self.colorTheme = colorTheme
    self.size = size
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
