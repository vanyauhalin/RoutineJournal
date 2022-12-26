import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public struct EventFormCategorySearchView: SwiftUI.View {
  public typealias Intent = EventFormCategorySearchIntent
  public typealias Model = EventFormCategorySearchModel
  public typealias View = EventFormCategorySearchView

  // @Environment(\.isSearching) private var isSearching
  @Environment(\.dismiss) private var dismiss
  @ObservedObject private var model: Model
  private var intent: Intent

  public var body: some SwiftUI.View {
    NavigationView {
      List {
        if model.query.isEmpty {
          if let objects = model.objects {
            Section("All Categories") {
              EventFormCategorySearchResultsView
                .render(objects)
                .onSelect { object in
                  intent.onSelect(object: object)
                  self.dismiss()
                }
            }
          }
        } else {
          if let objects = model.queryResults {
            EventFormCategorySearchResultsView
              .render(objects)
              .onSelect { object in
                intent.onSelect(object: object)
                self.dismiss()
              }
          }
        }
      }
      .listStyle(.plain)
      .navigationTitle("Category")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Cancel") {
            dismiss()
          }
        }
      }
    }
    .searchable(
      text: $model.query,
      placement: .navigationBarDrawer(displayMode: .always)
    )
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

struct EventFormCategorySearchView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { _ in
      EventFormCategorySearchView
        .render(Binding.constant(nil))
    }
    .id(name)
    .data()
    .sheet()
  }
}
