import RealmSwift
import RoutineJournalCore
import RoutineJournalIconView
import RoutineJournalUI
import SwiftUI

public struct EventFormCategorySearchResultsView: SwiftUI.View {
  public typealias Model = EventFormCategorySearchResultsModel
  public typealias Intent = EventFormCategorySearchResultsIntent
  public typealias View = EventFormCategorySearchResultsView

  private let model: Model
  private let intent: Intent

  public var body: some SwiftUI.View {
    ForEach(model.objects) { object in
      Button(
        action: {
          intent.onSelect(object: object)
        },
        label: {
          HStackLabel(
            title: {
              Text(object.title)
            },
            icon: {
              if let icon = object.icon {
                IconView()
                  .icon(icon)
                  .colorTheme(object.colorTheme)
              }
            }
          )
        }
      )
    }
  }

  public init(model: Model, intent: Intent) {
    self.model = model
    self.intent = intent
  }

  public static func render(_ objects: Results<CategoryObject>) -> View {
    let model = Model(objects: objects)
    let intent = Intent()
    return View(model: model, intent: intent)
  }

  public func onSelect(
    perform action: @escaping (CategoryObject) -> Void
  ) -> View {
    let model = Model(objects: model.objects)
    let intent = Intent(actionOnSelect: action)
    return View(model: model, intent: intent)
  }
}

struct EventFormCategorySearchResultsView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { context in
      List {
        if
          let objects = try? DataProvider
            .realm()
            .objects(CategoryObject.self)
        {
          EventFormCategorySearchResultsView
            .render(objects)
            .onSelect { _ in
              context.dismiss()
            }
        }
      }
      .listStyle(.plain)
    }
    .id(name)
    .modifier([.data, .sheet])
  }
}
