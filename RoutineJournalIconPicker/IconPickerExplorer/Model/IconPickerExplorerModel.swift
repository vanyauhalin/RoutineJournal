import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconSelectionModifier
import SwiftUI

public final class IconPickerExplorerModel:
  ObservableObject,
  MVIconSelectionModifierModel,
  MVColorThemeModifierModel
{
  public static let title = IconPickerModel.title

  @Published
  public var query = String.default

  public var iconSelection: Binding<IconObject>
  public var colorTheme: ColorTheme

  public init() {
    self.iconSelection = .constant(.default)
    self.colorTheme = .default
  }
}
