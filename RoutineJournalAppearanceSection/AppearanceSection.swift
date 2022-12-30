import RoutineJournalColorThemePicker
import RoutineJournalCore
import RoutineJournalIconPicker
import RoutineJournalMVI
import RoutineJournalTimeline
import RoutineJournalUI
import SwiftUI

public struct AppearanceSection: MVView {
  public typealias Model = AppearanceSectionModel

  public var model: Model

  public var body: some View {
    Section(Model.title) {
      TimelineItemView
        .render(model.previewEvent)
        .listRowSeparator(.hidden)
        .listRowInsets(
          EdgeInsets(
            top: 10,
            leading: 16,
            bottom: 6,
            trailing: 16
          )
        )
        .listRowBackground(
          Rectangle()
            .round([.topLeft, .topRight], radius: 7)
            .foregroundColor(.white)
        )
      ColorThemePicker()
        .selection(model.colorThemeSelection)
      IconPicker()
        .selection(model.iconSelection)
        .colorTheme(model.colorTheme)
    }
  }

  public init() {
    self.model = Model()
  }
}

struct AppearanceSection_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var colorTheme = ColorTheme.indigo
    @State
    private var icon = IconObject.default

    var body: some View {
      PreviewContext { _ in
        NavigationView {
          Form {
            AppearanceSection()
              .selection($colorTheme)
              .selection($icon)
          }
        }
      }
      .id(AppearanceSection_Previews.name)
      .modifier(.data)
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
