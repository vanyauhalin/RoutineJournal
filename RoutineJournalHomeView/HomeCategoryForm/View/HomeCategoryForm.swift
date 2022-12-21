import RoutineJournalCategoryForm
import RoutineJournalUI
import SwiftUI

public struct HomeCategoryForm: SwiftUI.View {
  public typealias Model = HomeCategoryFormModel
  public typealias View = HomeCategoryForm

  @ObservedObject private var model: Model

  public var body: some SwiftUI.View {
    Color
      .clear
      .toolbar {
        ToolbarItem(placement: .bottomBar) {
          Button(
            action: {
              model.showing.toggle()
            },
            label: {
              Image(systemName: model.iconName)
            }
          )
        }
      }
      .sheet(isPresented: $model.showing) {
        CategoryForm
          .render()
      }
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }
}

struct HomeCategoryForm_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .background {
          HomeCategoryForm
            .render()
        }
    }
  }
}
