import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class IconPickerOptionModel {
  public typealias Model = IconPickerOptionModel

  public let icon: IconObject
  public let iconSelection: Binding<IconObject>
  public let colorTheme: ColorTheme

  public var iconSelected: Bool {
    icon == iconSelection.wrappedValue
  }
  public var colorPalette: ColorPalette {
    ColorPalette.select(by: colorTheme)
  }
  public var backgroundColor: Color {
    colorPalette.color200
  }

  public init(
    icon: IconObject = .default,
    iconSelection: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .neutral
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

  public func update(iconSelection icon: IconObject) {
    iconSelection.wrappedValue = icon
  }

  public func select() {
    update(iconSelection: icon)
  }
}
