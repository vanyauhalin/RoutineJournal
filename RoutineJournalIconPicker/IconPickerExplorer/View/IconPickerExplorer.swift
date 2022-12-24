import RoutineJournalCore
import RoutineJournalIconSelectionModifier
import RoutineJournalUI
import SwiftUI

public struct IconPickerExplorer: MVIconSelectionModifier {
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
      PreviewBinding($icon) {
        PreviewSheet { _ in
          IconPickerExplorer()
            .selection($icon)
            .colorTheme(.indigo)
        }
      }
    }
  }

  static var previews: some View {
    PreviewData(self.name) {
      PreviewContainer()
    }
  }
}
