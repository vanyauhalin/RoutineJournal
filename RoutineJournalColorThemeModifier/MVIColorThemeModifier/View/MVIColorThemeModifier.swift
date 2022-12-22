import RoutineJournalCore
import RoutineJournalMVI

public protocol MVIColorThemeModifier: MVIView {
  func colorTheme(_ colorTheme: ColorTheme) -> Self
}

extension MVIColorThemeModifier where
  Model: MVIColorThemeModifierModel,
  Intent: MVIColorThemeModifierIntent,
  Intent.Model == Model
{
  public func colorTheme(_ colorTheme: ColorTheme) -> Self {
    let model = model.reinit(colorTheme: colorTheme)
    let intent = intent.reinit(model: model)
    return Self(model: model, intent: intent)
  }
}
