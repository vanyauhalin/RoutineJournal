import RoutineJournalCore
import RoutineJournalIconView
import RoutineJournalUI
import SwiftUI

public struct EventFormCategoryField: SwiftUI.View {
  public typealias Model = EventFormCategoryModel
  public typealias Intent = EventFormCategoryIntent
  public typealias View = EventFormCategoryField

  @ObservedObject private var model: Model
  private var intent: Intent

  public var body: some SwiftUI.View {
    NavigationButton(
      action: {
        intent.onTap()
      },
      label: {
        Text(model.title)
          .foregroundColor(model.foregroundColor)
          .lineLimit(1)
      },
      content: {
        if
          let icon = model.icon,
          let colorTheme = model.colorTheme
        {
          IconView()
            .icon(icon)
            .colorTheme(colorTheme)
        }
      }
    )
    .sheet(isPresented: $model.searchShowing) {
      EventFormCategorySearchView
        .render(model.object)
    }
  }

  public init(model: Model, intent: Intent) {
    self.model = model
    self.intent = intent
  }

  public static func render(_ object: Binding<CategoryObject?>) -> View {
    let model = Model(object: object)
    let intent = Intent(model: model)
    return View(model: model, intent: intent)
  }
}

struct EventFormCategoryField_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var object: CategoryObject? = CategoryObject(
      title: "Category Title",
      icon: IconObject(
        name: .airplane,
        type: .system
      ),
      colorTheme: .indigo
    )

    var body: some View {
      PreviewContext { _ in
        Form {
          EventFormCategoryField
            .render($object)
        }
      }
      .id(EventFormCategoryField_Previews.name)
      .modifier(.data)
      .value(object?.title)
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
