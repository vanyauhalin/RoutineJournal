import RoutineJournalCore
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct IconPickerExplorer: MVView {
  public typealias Model = IconPickerExplorerModel

  @Environment(\.dismiss)
  private var dismiss

  @ObservedObject
  public var model: Model

  public var body: some View {
    NavigationView {
      IconPickerOptions()
        .selection(model.iconSelection)
        .colorTheme(model.colorTheme)
        .query($model.query)
        .onSelect {
          dismiss()
        }
        .navigationTitle(Model.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Cancel") {
              dismiss()
            }
          }
        }
    }
    .searchable(
      text: $model.query,
      placement: .navigationBarDrawer(displayMode: .always)
    )
  }

  public init() {
    self.model = Model()
  }
}

struct IconPickerExplorer_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var icon = IconObject.default

    var body: some View {
      PreviewContext { _ in
        IconPickerExplorer()
          .selection($icon)
          .colorTheme(.indigo)
      }
      .id(IconPickerExplorer_Previews.name)
      .data()
      .sheet()
      .value(icon.name.rawValue)
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
