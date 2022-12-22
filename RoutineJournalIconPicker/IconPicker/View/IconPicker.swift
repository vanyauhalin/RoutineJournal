import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconSelectionModifier
import RoutineJournalIconView
import RoutineJournalUI
import SwiftUI

public struct IconPicker:
  SwiftUI.View,
  MVIIconSelectionModifier,
  MVIColorThemeModifier
{
  public typealias Intent = IconPickerIntent
  public typealias Model = IconPickerModel
  public typealias View = IconPicker

  @ObservedObject
  public var model: Model
  public var intent: Intent

  public var body: some SwiftUI.View {
    NavigationButton(
      Model.title,
      action: {
        intent.onPress()
      },
      content: {
        IconView
          .render()
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

  public static func render() -> View {
    let model = Model()
    let intent = Intent(model: model)
    return View(model: model, intent: intent)
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
            IconPicker
              .render()
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
