import RoutineJournalCore
import RoutineJournalMVI
import SwiftUI

public protocol MVColorThemeSelectionModifier:
  MVView,
  ColorThemeSelectionModifier
{}

extension MVColorThemeSelectionModifier where
  Model: MVColorThemeSelectionModifierModel
{
  public func selection(_ colorTheme: Binding<ColorTheme>) -> Self {
    let model = model.reinit(colorThemeSelection: colorTheme)
    return Self(model: model)
  }
}
