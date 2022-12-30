import RoutineJournalCategoryDetails
import RoutineJournalCategoryForm
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct CategoriesLink: MVView {
  public typealias Model = CategoriesLinkModel

  @ObservedObject
  public var model: Model

  public var body: some View {
    NavigationLink(Model.title) {
      List {
        if let categories = model.categories {
          ForEach(categories) { category in
            CategoryDetails()
              .category(category)
              .style(.navigationButton)
          }
        }
        CategoryForm()
          .style(.listItem)
      }
      .navigationTitle(Model.title)
    }
  }

  public init() {
    self.model = Model()
  }
}

struct CategoriesLink_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { _ in
      NavigationView {
        List {
          CategoriesLink()
        }
      }
    }
    .id(name)
    .modifier(.data)
  }
}
