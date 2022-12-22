import RoutineJournalColorThemeModifier
import RoutineJournalCore
import SwiftUI

public final class IconPickerExplorerModel:
  ObservableObject,
  MVColorThemeModifierModel
{
  public typealias Model = IconPickerExplorerModel

  public static let title = IconPickerModel.title

  @Published
  public var query = String.default

  public let iconSelection: Binding<IconObject>
  public var colorTheme: ColorTheme

  public init() {
    self.iconSelection = .constant(.default)
    self.colorTheme = .default
  }

  public init(
    iconSelection: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default
  ) {
    self.iconSelection = iconSelection
    self.colorTheme = colorTheme
  }

  public func reinit(
    iconSelection: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil
  ) -> Model {
    Model(
      iconSelection: iconSelection ?? self.iconSelection,
      colorTheme: colorTheme ?? self.colorTheme
    )
  }
}
