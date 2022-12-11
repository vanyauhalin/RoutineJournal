import RealmSwift
import RoutineJournalCore
import RoutineJournalIcon
import RoutineJournalUI
import SwiftUI

public struct EventFormCategorySearchResultsView: SwiftUI.View {
  public typealias Intent = EventFormCategorySearchResultsIntent
  public typealias Model = EventFormCategorySearchResultsModel
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
                IconView
                  .render(icon)
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
    let intent = Intent(selectAction: action)
    return View(model: model, intent: intent)
  }
}

struct EventFormCategorySearchResultsView_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var showing = false
    // False positive.
    // swiftlint:disable:next unused_declaration
    let objects = try? DataProvider.realm().objects(CategoryObject.self)

    var body: some View {
      Button("show") {
        showing.toggle()
      }
      .sheet(isPresented: $showing) {
        if let objects {
          EventFormCategorySearchResultsView
            .render(objects)
            .onSelect { _ in
              showing.toggle()
            }
        }
      }
    }
  }

  static var previews: some View {
    DataProvider.ExamplesView(self.name) {
      PreviewContainer()
    }
  }
}
