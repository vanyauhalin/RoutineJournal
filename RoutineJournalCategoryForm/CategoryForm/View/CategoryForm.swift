import RoutineJournalAppearanceSection
import RoutineJournalMVI
import RoutineJournalNameField
import RoutineJournalUI
import SwiftUI

public struct CategoryForm: MVIView {
  public typealias Intent = CategoryFormIntent
  public typealias Model = CategoryFormModel
  public typealias View = CategoryForm

  @Environment(\.dismiss)
  private var dismiss

  @ObservedObject
  public var model: Model
  public var intent: Intent

  public var body: some SwiftUI.View {
    NavigationView {
      Form {
        NameField()
          .text($model.name)
        AppearanceSection()
          .selection($model.colorTheme)
          .selection($model.icon)
      }
      .navigationTitle(Model.title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") {
            intent.onCancel()
            dismiss()
          }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button("Add") {
            intent.onConfirm()
            dismiss()
          }
        }
      }
    }
  }

  public init() {
    let model = Model()
    let intent = Intent(model: model)
    self.model = model
    self.intent = intent
  }
}

struct CategoryForm_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { _ in
      CategoryForm()
    }
    .id(name)
    .data()
    .sheet()
  }
}
