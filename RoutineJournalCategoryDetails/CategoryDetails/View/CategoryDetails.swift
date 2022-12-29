import RoutineJournalAppearanceSection
import RoutineJournalMVI
import RoutineJournalNameField
import RoutineJournalUI
import SwiftUI

public struct CategoryDetails: MVIView {
  public typealias Model = CategoryDetailsModel
  public typealias Intent = CategoryDetailsIntent
  public typealias Style = CategoryDetailsStyle

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
        HStack(spacing: .zero) {
          Spacer()
          Button("Delete Category", role: .destructive) {
            intent.onDelete()
          }
          Spacer()
        }
      }
      .navigationTitle(Model.title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel", role: .cancel) {
            intent.onCancel()
          }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button("Done") {
            intent.onConfirm()
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

  public func style<S>(_ style: S) -> some View
  where S: Style, S.Content == Self {
    style.body(content: self)
  }
}

struct CategoryDetails_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { context in
      CategoryDetails()
        .category(.mock1)
        .onCancel {
          context.decrement()
        }
        .onConfirm {
          context.increment()
        }
        .onDelete {
          context.decrement()
        }
    }
    .id(name)
    .position(.bottom, .leading)
    .modifier([.data, .counter])
  }
}
