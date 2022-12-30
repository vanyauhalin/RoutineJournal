import RoutineJournalCore

public protocol ColorThemeModifier: AnyObject {
  var colorTheme: ColorTheme { get set }

  func reinit(colorTheme: ColorTheme) -> Self
}

extension ColorThemeModifier {
  public func reinit(colorTheme: ColorTheme) -> Self {
    self.colorTheme = colorTheme
    return self
  }
}
