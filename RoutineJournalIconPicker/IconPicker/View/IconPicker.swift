import RoutineJournalCore
import RoutineJournalIconView
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct IconPicker: MVIView {
  public typealias Intent = IconPickerIntent
  public typealias Model = IconPickerModel

  @ObservedObject
  public var model: Model
  public var intent: Intent

  public var body: some View {
    NavigationButton(
      Model.title,
      action: {
        intent.onPress()
      },
      content: {
        IconView()
          .icon(model.icon)
          .colorTheme(model.colorTheme)
      }
    )
    .sheet(isPresented: $model.showingExplorer) {
      IconPickerExplorer()
        .selection(model.iconSelection)
        .colorTheme(model.colorTheme)
    }
  }

  public init() {
    let model = Model()
    let intent = Intent(model: model)
    self.model = model
    self.intent = intent
  }
}

struct IconPickerView_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var icon = IconObject.default

    var body: some View {
      PreviewBinding($icon) {
        NavigationView {
          Form {
            IconPicker()
              .selection($icon)
              .colorTheme(.indigo)
          }
        }
      }
    }
  }

  static var previews: some View {
    PreviewData(self.name) {
      PreviewContainer()
    }
  }
}
