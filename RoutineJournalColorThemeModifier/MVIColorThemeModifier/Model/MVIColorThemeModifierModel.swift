import RoutineJournalCore
import RoutineJournalMVI

public protocol MVIColorThemeModifierModel: MVIModel {
  var colorTheme: ColorTheme { get set }

  func reinit(colorTheme: ColorTheme) -> Self
}

extension MVIColorThemeModifierModel {
  public func reinit(colorTheme: ColorTheme) -> Self {
    self.colorTheme = colorTheme
    return self
  }
}
