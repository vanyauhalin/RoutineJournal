import RoutineJournalColorThemePicker
import RoutineJournalCore
import RoutineJournalIconPicker
import RoutineJournalTimeline
import RoutineJournalUI
import SwiftUI

public struct CategoryForm: SwiftUI.View {
  public typealias Intent = CategoryFormIntent
  public typealias Model = CategoryFormModel
  public typealias View = CategoryForm

  @Environment(\.dismiss) private var dismiss
  @ObservedObject private var model: Model
  private let intent: Intent

  public var body: some SwiftUI.View {
    NavigationView {
      Form {
        CategoryFormNameField
          .render()
          .text($model.name)
        CategoryFormAppearanceSection
          .render()
          .selection($model.colorTheme)
          .selection($model.icon)
      }
      .navigationTitle(model.navigationTitle)
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

  public init(model: Model, intent: Intent) {
    self.model = model
    self.intent = intent
  }

  public static func render() -> View {
    let model = Model()
    let intent = Intent(model: model)
    return View(model: model, intent: intent)
  }
}

struct CategoryForm_Previews: PreviewProvider {
  static var previews: some View {
    PreviewData(self.name) {
      PreviewSheet { _ in
        CategoryForm
          .render()
      }
    }
  }
}