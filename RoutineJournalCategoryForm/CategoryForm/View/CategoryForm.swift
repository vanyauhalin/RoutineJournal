import RoutineJournalAppearanceSection
import RoutineJournalMVI
import RoutineJournalNameField
import RoutineJournalUI
import SwiftUI

public struct CategoryForm: MVIView {
  public typealias Model = CategoryFormModel
  public typealias Intent = CategoryFormIntent
  public typealias Style = CategoryFormStyle

  @Environment(\.dismiss)
  private var dismiss

  @ObservedObject
  public var model: Model
  public var intent: Intent

  public var body: some View {
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

  public func style<Style>(_ style: Style) -> some View
  where Style: CategoryFormStyle, Style.Content == Self {
    style.body(content: self)
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
