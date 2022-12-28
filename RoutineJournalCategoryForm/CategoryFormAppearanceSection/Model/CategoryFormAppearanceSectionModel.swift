import RoutineJournalCore
import RoutineJournalFoundation
import SwiftUI

public final class CategoryFormAppearanceSectionModel {
  public typealias Model = CategoryFormAppearanceSectionModel

  public let sectionTitle = "Appearance"
  public let selectionIcon: Binding<IconObject>
  public let selectionColorTheme: Binding<ColorTheme>

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
  public var icon: IconObject {
    selectionIcon.wrappedValue
  }
  public var colorTheme: ColorTheme {
    selectionColorTheme.wrappedValue
  }

  public init(
    selectionIcon: Binding<IconObject> = .constant(.default),
    selectionColorTheme: Binding<ColorTheme> = .constant(.default)
  ) {
    self.selectionIcon = selectionIcon
    self.selectionColorTheme = selectionColorTheme
  }

  public func reinit(
    selectionIcon: Binding<IconObject>? = nil,
    selectionColorTheme: Binding<ColorTheme>? = nil
  ) -> Model {
    Model(
      selectionIcon: selectionIcon ?? self.selectionIcon,
      selectionColorTheme: selectionColorTheme ?? self.selectionColorTheme
    )
  }
}
