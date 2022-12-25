import RoutineJournalCore
import RoutineJournalIconView
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct CategoryLabel: MVView {
  public typealias Model = CategoryLabelModel

  public var model: Model

  public var body: some View {
    if
      let title = model.title,
      let icon = model.icon,
      let colorTheme = model.colorTheme
    {
      Label(
        title: {
          Text(title)
        },
        icon: {
          IconView()
            .icon(icon)
            .colorTheme(colorTheme)
        }
      )
    }
  }

  public init() {
    self.model = Model()
  }
}

struct CategoryLabel_Previews: PreviewProvider {
  static var previews: some View {
    CategoryLabel()
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
