import RoutineJournalCore
import RoutineJournalIconView
import RoutineJournalUI
import SwiftUI

public struct IconPicker: SwiftUI.View {
  public typealias Intent = IconPickerIntent
  public typealias Model = IconPickerModel
  public typealias View = IconPicker

  @ObservedObject
  private var model: Model
  private let intent: Intent

  public var body: some SwiftUI.View {
    NavigationButton(
      model.title,
      action: {
        intent.onPress()
      },
      content: {
        IconView
          .render()
          .icon(model.iconSelection.wrappedValue)
          .colorTheme(model.colorTheme)
      }
    )
    .sheet(isPresented: $model.showingExplorer) {
      IconPickerExplorerView
        .render()
        .navigationTitle(model.title)
        .selection(model.iconSelection)
        .colorTheme(model.colorTheme)
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

  public func selection(_ icon: Binding<IconObject>) -> View {
    let model = model.reinit(iconSelection: icon)
    let intent = intent.reinit(model: model)
    return View(model: model, intent: intent)
  }

  public func colorTheme(_ colorTheme: ColorTheme) -> View {
    let model = model.reinit(colorTheme: colorTheme)
    let intent = intent.reinit(model: model)
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
