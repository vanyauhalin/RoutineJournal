import RoutineJournalCategoryLabel
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct NavigationButtonCategoryDetailsStyle:
  MVIView,
  CategoryDetailsStyle
{
  public typealias Model = NavigationButtonCategoryDetailsStyleModel
  public typealias Intent = NavigationButtonCategoryDetailsStyleIntent
  public typealias Content = CategoryDetails

  @ObservedObject
  public var model: Model
  public var intent: Intent
  public var content: Content

  public var body: some View {
    NavigationButton(
      action: {
        intent.onPress()
      },
      label: {
        CategoryLabel()
          .category(content.model.category)
      }
    )
    .sheet(isPresented: $model.showingContent) {
      content
        .onCancel {
          intent.onCancel()
        }
        .onConfirm {
          intent.onConfirm()
        }
        .onDelete {
          intent.onDelete()
        }
    }
  }

  public init() {
    let model = Model()
    let intent = Intent(model: model)
    let content = Content()
    self.model = model
    self.intent = intent
    self.content = content
  }
}

struct NavigationButtonCategoryDetailsStyle_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { _ in
      NavigationView {
        List {
          CategoryDetails()
            .category(.mock1)
            .style(.navigationButton)
        }
      }
    }
    .id(name)
    .modifier(.data)
  }
}
