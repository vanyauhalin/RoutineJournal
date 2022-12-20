import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class ColorThemePickerModel {
  public typealias Model = ColorThemePickerModel

  public let title = "Color Theme"
  public let selectionColorTheme: Binding<ColorTheme>

  public init(selectionColorTheme: Binding<ColorTheme> = .constant(.default)) {
    self.selectionColorTheme = selectionColorTheme
  }

  public func reinit(selectionColorTheme: Binding<ColorTheme>? = nil) -> Model {
    Model(selectionColorTheme: selectionColorTheme ?? self.selectionColorTheme)
  }
}
