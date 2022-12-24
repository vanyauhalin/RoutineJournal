import RoutineJournalCore
import RoutineJournalMVI

extension MVView where Model: ColorThemeModifier {
  public func colorTheme(_ colorTheme: ColorTheme) -> Self {
    let model = model.reinit(colorTheme: colorTheme)
    return Self(model: model)
  }
}
