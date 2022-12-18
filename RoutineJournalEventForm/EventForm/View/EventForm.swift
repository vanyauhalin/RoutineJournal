import RoutineJournalUI
import SwiftUI

public struct EventForm: SwiftUI.View {
  public typealias Intent = EventFormIntent
  public typealias Model = EventFormModel
  public typealias View = EventForm

  @Environment(\.dismiss) private var dismiss
  @ObservedObject private var model: Model
  private var intent: Intent

  public var body: some SwiftUI.View {
    NavigationView {
      Form {
        Section {
          EventFormTitleField
            .render($model.title)
          EventFormCategoryField
            .render($model.category)
        }
        Section {
          EventFormStartsField
            .render($model.startDate)
          EventFormEndsField
            .render($model.endDate)
        }
        Section {
          EventFormNotesField
            .render($model.notes)
        }
      }
      .navigationTitle("New Event")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Cancel") {
            dismiss()
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Add") {
            intent.onAdd()
            dismiss()
          }
        }
      }
    }
  }

  public init(model: Model, intent: Intent) {
    self.model = model
    self.intent = intent
  }

  public static func render() -> View {
    let model = Model()
    let intent = Intent(model: model)
    return View(model: model, intent: intent)
  }

  public func onAdd(perform action: @escaping (Model) -> Void) -> View {
    let model = Model()
    let intent = Intent(model: model, addAction: action)
    return View(model: model, intent: intent)
  }
}

struct EventForm_Previews: PreviewProvider {
  static var previews: some View {
    PreviewData(self.name) {
      PreviewSheet { toggle in
        EventForm
          .render()
          .onAdd { _ in
            toggle()
          }
      }
    }
  }
}
