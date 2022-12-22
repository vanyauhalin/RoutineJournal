import RoutineJournalCore
import RoutineJournalMV

public protocol ColorThemeMVModifierModel: MVModel {
  var colorTheme: ColorTheme { get set }

  func reinit(colorTheme: ColorTheme) -> Self
}

extension ColorThemeMVModifierModel {
  public func reinit(colorTheme: ColorTheme) -> Self {
    self.colorTheme = colorTheme
    return self
  }
}
