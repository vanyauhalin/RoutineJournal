import RoutineJournalCore
import RoutineJournalMVI

public protocol ColorThemeMVIModifier: MVIView {
  func colorTheme(_ colorTheme: ColorTheme) -> Self
}

extension ColorThemeMVIModifier where
  Model: ColorThemeMVIModifierModel,
  Intent: ColorThemeMVIModifierIntent,
  Intent.Model == Model
{
  public func colorTheme(_ colorTheme: ColorTheme) -> Self {
    let model = model.reinit(colorTheme: colorTheme)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
