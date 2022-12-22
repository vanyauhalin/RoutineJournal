import RoutineJournalCore
import RoutineJournalMVI

public protocol ColorThemeModifierModel: MVIModel {
  var colorTheme: ColorTheme { get set }

  func reinit(colorTheme: ColorTheme) -> Self
}

extension ColorThemeModifierModel {
  public func reinit(colorTheme: ColorTheme) -> Self {
    self.colorTheme = colorTheme
    return self
  }
}
