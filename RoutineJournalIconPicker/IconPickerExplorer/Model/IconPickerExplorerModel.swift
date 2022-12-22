import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconSelectionModifier
import SwiftUI

public final class IconPickerExplorerModel:
  ObservableObject,
  MVIconSelectionModifierModel,
  MVColorThemeModifierModel
{
  public typealias Model = IconPickerExplorerModel

  public static let title = IconPickerModel.title

  @Published
  public var query = String.default

  public var iconSelection: Binding<IconObject>
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
