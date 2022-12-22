import RoutineJournalCore

public protocol ColorThemeModifierModel: AnyObject {
  var colorTheme: ColorTheme { get set }

  func reinit(colorTheme: ColorTheme) -> Self
}

extension ColorThemeModifierModel {
  public func reinit(colorTheme: ColorTheme) -> Self {
    self.colorTheme = colorTheme
    return self
  }
}
