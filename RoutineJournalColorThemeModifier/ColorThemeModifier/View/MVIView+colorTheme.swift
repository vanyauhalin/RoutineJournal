import RoutineJournalCore
import RoutineJournalMVI

extension MVIView where Model: ColorThemeModifier, Intent.Model == Model {
  public func colorTheme(_ colorTheme: ColorTheme) -> Self {
    let model = model.reinit(colorTheme: colorTheme)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
