import RoutineJournalCategoryLabel
import RoutineJournalCore
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct CategoryPicker: MVIView {
  public typealias Model = CategoryPickerModel
  public typealias Intent = CategoryPickerIntent

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
        CategoryLabel()
          .category(model.category)
          .labelStyle(.close)
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
      PreviewContext { _ in
        NavigationView {
          Form {
            CategoryPicker()
              .selection($category)
          }
        }
      }
      .id(CategoryPicker_Previews.name)
      .modifier(.data)
      .value(category?.title)
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
