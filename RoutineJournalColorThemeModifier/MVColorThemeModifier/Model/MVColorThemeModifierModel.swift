import RoutineJournalCore
import RoutineJournalMV

public protocol MVColorThemeModifierModel: MVModel {
  var colorTheme: ColorTheme { get set }

  func reinit(colorTheme: ColorTheme) -> Self
}

extension MVColorThemeModifierModel {
  public func reinit(colorTheme: ColorTheme) -> Self {
    self.colorTheme = colorTheme
    return self
  }
}
