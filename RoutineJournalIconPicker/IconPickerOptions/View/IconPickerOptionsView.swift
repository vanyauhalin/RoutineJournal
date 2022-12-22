import RoutineJournalCore
import RoutineJournalIconView
import RoutineJournalUI
import SwiftUI

public struct IconPickerOptionsView: SwiftUI.View {
  public typealias Intent = IconPickerOptionsIntent
  public typealias Model = IconPickerOptionsModel
  public typealias View = IconPickerOptionsView

  @ObservedObject private var model: Model
  private let intent: Intent

  @ScaledMetric private var scale = 1
  public var width: Double {
    Model.width * scale
  }
  public var spacing: Double {
    Model.spacing * scale
  }
  public var columns: [GridItem] {
    [GridItem(.adaptive(minimum: width), spacing: spacing)]
  }

  public var body: some SwiftUI.View {
    List {
      ForEach(model.collections, id: \.self.0) { title, icons in
        Section(title) {
          LazyVGrid(columns: columns, spacing: spacing) {
            if let icons = model.icons {
              ForEach(icons) { icon in
                IconPickerOption
                  .render()
                  .icon(icon)
                  .selection(model.selectionIcon)
                  .colorTheme(model.colorTheme)
                  .onSelect {
                    intent.onSelect()
                  }
              }
            }
          }
        }
      }
    }
    .listStyle(.plain)
  }

  public init(model: Model, intent: Intent) {
    self.model = model
    self.intent = intent
  }

  public static func render() -> View {
    let model = Model()
    let intent = Intent()
    return View(model: model, intent: intent)
  }

  public func selection(_ icon: Binding<IconObject>) -> View {
    let model = model.reinit(selectionIcon: icon)
    let intent = intent.reinit()
    return View(model: model, intent: intent)
  }

  public func colorTheme(_ colorTheme: ColorTheme) -> View {
    let model = model.reinit(colorTheme: colorTheme)
    let intent = intent.reinit()
    return View(model: model, intent: intent)
  }

  public func query(_ query: Binding<String>) -> View {
    let model = model.reinit(query: query)
    let intent = intent.reinit()
    return View(model: model, intent: intent)
  }

  public func onSelect(perform action: @escaping () -> Void) -> View {
    let model = model.reinit()
    let intent = intent.reinit(selectAction: action)
    return View(model: model, intent: intent)
  }
}

struct IconPickerOptionsView_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var icon = IconObject.default

    var body: some View {
      PreviewBinding($icon) {
        PreviewSheet { toggle in
          IconPickerOptionsView
            .render()
            .selection($icon)
            .colorTheme(.indigo)
            .onSelect {
              toggle()
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
