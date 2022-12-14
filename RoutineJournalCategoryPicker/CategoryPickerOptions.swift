import RoutineJournalCore
import RoutineJournalFoundation
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct CategoryPickerOptions: MVIView {
  public typealias Model = CategoryPickerOptionsModel
  public typealias Intent = CategoryPickerOptionsIntent

  @ObservedObject
  public var model: Model
  public var intent: Intent

  public var body: some View {
    List {
      if let categories = model.categories {
        Section("All categories") {
          ForEach(categories) { category in
            CategoryPickerOption()
              .category(category)
              .selection(model.categorySelection)
              .onSelect {
                intent.onSelect()
              }
          }
        }
      }
    }
  }

  public init() {
    let model = Model()
    let intent = Intent(model: model)
    self.model = model
    self.intent = intent
  }
}

struct CategoryPickerOptions_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var category: CategoryObject?
    @State
    private var query: String = .default

    var body: some View {
      PreviewContext { context in
        CategoryPickerOptions()
          .selection($category)
          .query($query)
          .onSelect {
            context.dismiss()
          }
      }
      .id(CategoryPickerOptions_Previews.name)
      .modifier([.data, .sheet])
      .value([category?.title, query])
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
