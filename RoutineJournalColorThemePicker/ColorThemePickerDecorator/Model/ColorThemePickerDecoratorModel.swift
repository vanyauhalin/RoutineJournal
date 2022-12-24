import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class ColorThemePickerDecoratorModel: ColorThemeModifier {
  public static let width: Double = 11

  public var colorTheme: ColorTheme

  public var colorPalette: ColorPalette {
    ColorPalette.select(by: colorTheme)
  }
  public var foregroundColor: Color {
    colorPalette.color600
  }

  public init() {
    self.colorTheme = .default
  }
}
