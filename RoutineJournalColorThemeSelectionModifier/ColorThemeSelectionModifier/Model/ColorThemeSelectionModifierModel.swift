import RoutineJournalCore
import SwiftUI

public protocol ColorThemeSelectionModifierModel: AnyObject {
  var colorThemeSelection: Binding<ColorTheme> { get set }

  func reinit(colorThemeSelection: Binding<ColorTheme>) -> Self
}

extension ColorThemeSelectionModifierModel {
  public func reinit(colorThemeSelection: Binding<ColorTheme>) -> Self {
    self.colorThemeSelection = colorThemeSelection
    return self
  }
}
