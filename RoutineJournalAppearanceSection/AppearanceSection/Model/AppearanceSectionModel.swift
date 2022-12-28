import RoutineJournalColorThemeSelectionModifier
import RoutineJournalCore
import RoutineJournalFoundation
import RoutineJournalIconSelectionModifier
import SwiftUI

public final class AppearanceSectionModel:
  ColorThemeSelectionModifier,
  IconSelectionModifier
{
  public static let title = "Appearance"

  public var iconSelection: Binding<IconObject>
  public var colorThemeSelection: Binding<ColorTheme>

  public var icon: IconObject {
    iconSelection.wrappedValue
  }
  public var colorTheme: ColorTheme {
    colorThemeSelection.wrappedValue
  }
  public var previewEvent: EventObject {
    EventObject(
      category: CategoryObject(
        title: "Shopping trip",
        icon: icon,
        colorTheme: colorTheme
      ),
      title: "Shopping in an airport boutique",
      notes: "Finally I have this perfume",
      startDate: .since1970,
      endDate: .default
    )
  }

  public init() {
    self.iconSelection = .constant(.default)
    self.colorThemeSelection = .constant(.default)
  }
}
