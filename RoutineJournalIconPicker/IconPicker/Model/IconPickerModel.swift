import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconSelectionModifier
import SwiftUI

public final class IconPickerModel:
  ObservableObject,
  MVIIconSelectionModifierModel,
  ColorThemeModifier
{
  public static let title = "Icon"

  @Published
  public var showingExplorer = false

  public var iconSelection: Binding<IconObject>
  public var colorTheme: ColorTheme

  public var icon: IconObject {
    iconSelection.wrappedValue
  }

  public init() {
    self.iconSelection = .constant(.default)
    self.colorTheme = .default
  }

  public func showExplorer() {
    showingExplorer = true
  }
}
