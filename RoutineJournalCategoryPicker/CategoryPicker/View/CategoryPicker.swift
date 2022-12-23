import RoutineJournalCategorySelectionModifier
import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public struct CategoryPicker: MVICategorySelectionModifier {
  public typealias Intent = CategoryPickerIntent
  public typealias Model = CategoryPickerModel

  @ObservedObject
  public var model: Model
  public var intent: Intent

  public var body: some View {
    NavigationButton(
      Model.title,
      action: {
        intent.onPress()
      },
      content: {
        CategoryPickerLabel()
          .category(model.category)
          .environment(\.navigationPickerOptionPosition, .label)
          .foregroundColor(.systemGray)
      }
    )
    .sheet(isPresented: $model.showingExplorer) {
      CategoryPickerExplorer()
        .selection(model.categorySelection)
    }
  }

  public init() {
    let model = Model()
    let intent = Intent(model: model)
    self.model = model
    self.intent = intent
  }
}

struct CategoryPicker_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var category: CategoryObject?

    var body: some View {
      PreviewBinding($category) {
        NavigationView {
          Form {
            CategoryPicker()
              .selection($category)
          }
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
