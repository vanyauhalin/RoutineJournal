import RoutineJournalCore
import RoutineJournalMV

public protocol MVColorThemeModifier: MVView {
  func colorTheme(_ colorTheme: ColorTheme) -> Self
}

extension MVColorThemeModifier where Model: MVColorThemeModifierModel {
  public func colorTheme(_ colorTheme: ColorTheme) -> Self {
    let model = model.reinit(colorTheme: colorTheme)
    return Self(model: model)
  }
}
