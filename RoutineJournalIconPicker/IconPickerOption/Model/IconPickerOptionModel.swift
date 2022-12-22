import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class IconPickerOptionModel: ColorThemeModifierModel {
  public typealias Model = IconPickerOptionModel

  public static let cornerRadius: Double = 7
  public static let width: Double = 28 + 8
  public static let height: Double = 28 + 8

  public let icon: IconObject
  public let iconSelection: Binding<IconObject>
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

  public init(
    icon: IconObject = .default,
    iconSelection: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default
  ) {
    self.icon = icon
    self.iconSelection = iconSelection
    self.colorTheme = colorTheme
  }

  public func reinit(
    icon: IconObject? = nil,
    iconSelection: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil
  ) -> Model {
    Model(
      icon: icon ?? self.icon,
      iconSelection: iconSelection ?? self.iconSelection,
      colorTheme: colorTheme ?? self.colorTheme
    )
  }

  public func select() {
    iconSelection.wrappedValue = icon
  }
}
