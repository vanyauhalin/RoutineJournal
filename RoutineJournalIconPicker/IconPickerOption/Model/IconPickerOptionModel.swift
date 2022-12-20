import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class IconPickerOptionModel: Colorable {
  public typealias Model = IconPickerOptionModel

  public let icon: IconObject
  public let selectionIcon: Binding<IconObject>
  public let colorTheme: ColorTheme
  public var colors: Colors

  public var selectedIcon: Bool {
    icon == selectionIcon.wrappedValue
  }

  public init(
    icon: IconObject = .default,
    selectionIcon: Binding<IconObject> = Binding.constant(.default),
    colorTheme: ColorTheme = .neutral
  ) {
    self.icon = icon
    self.selectionIcon = selectionIcon
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
    selectionIcon: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil
  ) -> Model {
    Model(
      icon: icon ?? self.icon,
      selectionIcon: selectionIcon ?? self.selectionIcon,
      colorTheme: colorTheme ?? self.colorTheme
    )
  }

  public func update(selectionIcon icon: IconObject) {
    selectionIcon.wrappedValue = icon
  }

  public func select() {
    update(selectionIcon: icon)
  }
}
