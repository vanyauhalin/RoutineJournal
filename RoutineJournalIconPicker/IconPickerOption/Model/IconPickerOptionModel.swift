import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconModifier
import RoutineJournalIconSelectionModifier
import RoutineJournalSelectModifier
import RoutineJournalUI
import SwiftUI

public final class IconPickerOptionModel:
  IconModifier,
  IconSelectionModifier,
  ColorThemeModifier,
  MVISelectModifierModel
{
  public static let cornerRadius: Double = 7
  public static let width: Double = 28 + 8
  public static let height: Double = 28 + 8

  public var icon: IconObject
  public var iconSelection: Binding<IconObject>
  public var colorTheme: ColorTheme

  public var iconSelected: Bool {
    icon == iconSelection.wrappedValue
  }
  public var colorPalette: ColorPalette {
    ColorPalette.select(by: colorTheme)
  }
  public var backgroundColor: Color {
    colorPalette.color200
  }

  public init() {
    self.icon = .default
    self.iconSelection = .constant(.default)
    self.colorTheme = .default
  }

  public func select() {
    iconSelection.wrappedValue = icon
  }
}
