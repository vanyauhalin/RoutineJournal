import RoutineJournalCore
import RoutineJournalMVI
import SwiftUI

extension MVView where Model: ColorThemeSelectionModifier {
  public func selection(_ colorTheme: Binding<ColorTheme>) -> Self {
    let model = model.reinit(colorThemeSelection: colorTheme)
    return Self(model: model)
  }
}
