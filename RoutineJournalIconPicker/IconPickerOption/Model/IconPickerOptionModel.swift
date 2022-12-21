import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class IconPickerOptionModel: Colorable {
  public typealias Model = IconPickerOptionModel

  public let icon: IconObject
  public let iconSelection: Binding<IconObject>
  public let colorTheme: ColorTheme
  public var colors: Colors

  public var selectedIcon: Bool {
    icon == iconSelection.wrappedValue
  }

  public init(
    icon: IconObject = .default,
    iconSelection: Binding<IconObject> = Binding.constant(.default),
    colorTheme: ColorTheme = .neutral
  ) {
    self.icon = icon
    self.iconSelection = iconSelection
    self.colorTheme = colorTheme
    self.colors = Model.colors(by: colorTheme)
  }

  public static func colors(by colorTheme: ColorTheme) -> Colors {
    Colors.create(from: colorTheme) { palette in
      Colors(backgroundColor: palette.color200)
    }
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
