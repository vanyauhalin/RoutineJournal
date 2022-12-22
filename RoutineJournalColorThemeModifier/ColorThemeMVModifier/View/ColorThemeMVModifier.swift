import RoutineJournalCore
import RoutineJournalMV

public protocol ColorThemeMVModifier: MVView {
  func colorTheme(_ colorTheme: ColorTheme) -> Self
}

extension ColorThemeMVModifier where Model: ColorThemeMVModifierModel {
  public func colorTheme(_ colorTheme: ColorTheme) -> Self {
    let model = model.reinit(colorTheme: colorTheme)
    return Self(model: model)
  }
}
