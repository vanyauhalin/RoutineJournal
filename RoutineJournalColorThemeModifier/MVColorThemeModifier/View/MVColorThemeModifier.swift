import RoutineJournalCore
import RoutineJournalMVI

public protocol MVColorThemeModifier: MVView, ColorThemeModifier {}

extension MVColorThemeModifier where Model: MVColorThemeModifierModel {
  public func colorTheme(_ colorTheme: ColorTheme) -> Self {
    let model = model.reinit(colorTheme: colorTheme)
    return Self(model: model)
  }
}
