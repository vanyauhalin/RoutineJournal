import RoutineJournalMVI
import RoutineJournalUI
import RoutineJournalViewStyle
import SwiftUI

public struct ListItemCategoryFormStyle: MVIView, CategoryFormStyle {
  public typealias Model = ListItemCategoryFormStyleModel
  public typealias Intent = ListItemCategoryFormStyleIntent
  public typealias Content = CategoryForm

  @ObservedObject
  public var model: Model
  public var intent: Intent
  public var content: Content

  public var body: some View {
    Button(
      action: {
        intent.onPress()
      },
      label: {
        Label(Model.title, systemImage: Model.systemImage)
      }
    )
    .sheet(isPresented: $model.showingForm) {
      content
        .onConfirm {
          intent.onConfirm()
        }
        .onCancel {
          intent.onCancel()
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

struct ListItemCategoryFormStyle_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { _ in
      List {
        CategoryForm()
          .style(.listItem)
      }
    }
    .id(name)
    .modifier(.data)
  }
}
