import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconSelectionModifier
import RoutineJournalUI
import SwiftUI

public struct IconPickerOptions:
  SwiftUI.View,
  MVIIconSelectionModifier,
  MVIColorThemeModifier
{
  public typealias Intent = IconPickerOptionsIntent
  public typealias Model = IconPickerOptionsModel
  public typealias View = IconPickerOptions

  @ScaledMetric
  private var scale = 1

  @ObservedObject
  public var model: Model
  public var intent: Intent

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
            ForEach(icons) { icon in
              IconPickerOption
                .render()
                .icon(icon)
                .selection(model.iconSelection)
                .colorTheme(model.colorTheme)
                .onSelect {
                  intent.onSelect()
                }
            }
          }
        }
      }
    }
    .listStyle(.plain)
  }

  public init() {
    let model = Model()
    let intent = Intent(model: model)
    self.model = model
    self.intent = intent
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

struct IconPickerOptions_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var icon = IconObject.default

    var body: some View {
      PreviewBinding($icon) {
        PreviewSheet { toggle in
          IconPickerOptions
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
