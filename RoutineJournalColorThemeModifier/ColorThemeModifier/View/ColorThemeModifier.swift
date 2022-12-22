import RoutineJournalCore
import RoutineJournalMVI

public protocol ColorThemeModifier: MVIView {
  func colorTheme(_ colorTheme: ColorTheme) -> Self
}

extension ColorThemeModifier where
  Model: ColorThemeModifierModel,
  Intent: ColorThemeModifierIntent,
  Intent.Model == Model
{
  public func colorTheme(_ colorTheme: ColorTheme) -> Self {
    let model = model.reinit(colorTheme: colorTheme)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
