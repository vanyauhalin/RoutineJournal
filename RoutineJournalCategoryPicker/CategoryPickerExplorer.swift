import RoutineJournalCore
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct CategoryPickerExplorer: MVView {
  public typealias Model = CategoryPickerExplorerModel

  @Environment(\.dismiss)
  private var dismiss

  @ObservedObject
  public var model: Model

  public var body: some View {
    NavigationView {
      CategoryPickerOptions()
        .selection(model.categorySelection)
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

struct CategoryPickerExplorer_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var category: CategoryObject?

    var body: some View {
      PreviewContext { _ in
        CategoryPickerExplorer()
          .selection($category)
      }
      .id(CategoryPickerExplorer_Previews.name)
      .modifier([.data, .sheet])
      .value(category?.title)
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
