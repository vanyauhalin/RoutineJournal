import RoutineJournalCore
import RoutineJournalMVI

public protocol ColorThemeMVModifier: MVView {
  func colorTheme(_ colorTheme: ColorTheme) -> Self
}

extension ColorThemeMVModifier where Model: ColorThemeModifierModel {
  public func colorTheme(_ colorTheme: ColorTheme) -> Self {
    let model = model.reinit(colorTheme: colorTheme)
    return Self(model: model)
  }
}
