import RoutineJournalCore
import RoutineJournalIconView
import RoutineJournalMVI
import SwiftUI

public struct CategoryPickerLabel: MVView {
  public typealias Model = CategoryPickerLabelModel

  @Environment(\.navigationPickerOptionPosition)
  private var optionPosition

  public var model: Model

  public var spacing: Double {
    switch optionPosition {
      case .destination:
        return Model.destinationSpacing
      case .label:
        return Model.labelSpacing
    }
  }

  public var body: some View {
    HStack(spacing: spacing) {
      if let category = model.category {
        if let icon = category.icon {
          IconView()
            .icon(icon)
            .colorTheme(category.colorTheme)
        }
        Text(category.title)
      }
    }
  }

  public init() {
    self.model = Model()
  }
}

struct CategoryPickerLabel_Previews: PreviewProvider {
  static var previews: some View {
    CategoryPickerLabel()
      .category(
        CategoryObject(
          title: "Flights",
          icon: IconObject(
            name: .airplane,
            type: .system
          ),
          colorTheme: .indigo
        )
      )
  }
}
