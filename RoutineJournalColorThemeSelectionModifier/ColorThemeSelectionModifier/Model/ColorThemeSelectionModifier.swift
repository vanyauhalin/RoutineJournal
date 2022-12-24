import RoutineJournalCore
import SwiftUI

public protocol ColorThemeSelectionModifier: AnyObject {
  var colorThemeSelection: Binding<ColorTheme> { get set }

  func reinit(colorThemeSelection: Binding<ColorTheme>) -> Self
}

extension ColorThemeSelectionModifier {
  public func reinit(colorThemeSelection: Binding<ColorTheme>) -> Self {
    self.colorThemeSelection = colorThemeSelection
    return self
  }
}
