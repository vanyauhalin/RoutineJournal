import RoutineJournalCategoryLabel
import RoutineJournalCore
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct CategoryPickerOption: MVIView {
  public typealias Model = CategoryPickerOptionModel
  public typealias Intent = CategoryPickerOptionIntent

  public var model: Model
  public var intent: Intent

  public var body: some View {
    Button(
      action: {
        intent.onSelect()
      },
      label: {
        CategoryLabel()
          .category(model.category)
          .foregroundColor(.label)
          .if(model.categorySelected) { view in
            HStack(spacing: .zero) {
              view
              Spacer()
              Image(systemName: "checkmark")
                .font(.headline)
            }
          }
      }
    )
  }

  public init() {
    let model = Model()
    let intent = Intent(model: model)
    self.model = model
    self.intent = intent
  }
}

struct CategoryPickerOption_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var category: CategoryObject?

    let first: CategoryObject
    let last: CategoryObject

    var body: some View {
      PreviewContext { context in
        List {
          CategoryPickerOption()
            .category(first)
            .selection($category)
            .onSelect {
              context.dismiss()
            }
          CategoryPickerOption()
            .category(last)
            .selection($category)
            .onSelect {
              context.dismiss()
            }
        }
      }
      .id(CategoryPickerOption_Previews.name)
      .modifier(.sheet)
      .value(category?.title)
    }

    init() {
      let first = CategoryObject(
        title: "Flights",
        icon: IconObject(
          name: .airplane,
          type: .system
        ),
        colorTheme: .indigo
      )
      let last = CategoryObject(
        title: "Shopping trip",
        icon: IconObject(
          name: .cart,
          type: .system
        ),
        colorTheme: .rose
      )
      self.category = nil
      self.first = first
      self.last = last
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
