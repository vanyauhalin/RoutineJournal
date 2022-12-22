import RoutineJournalCore
import RoutineJournalIconView
import RoutineJournalUI
import SwiftUI

public struct IconPickerOption: SwiftUI.View {
  public typealias Intent = IconPickerOptionIntent
  public typealias Model = IconPickerOptionModel
  public typealias View = IconPickerOption

  private let model: Model
  private let intent: Intent

  public var body: some SwiftUI.View {
    Button(
      action: {
        intent.onSelect()
      },
      label: {
        IconView
          .render()
          .icon(model.icon)
          .colorTheme(model.colorTheme)
          .if(model.iconSelected) { view in
            view
              .background {
                RoundedRectangle(cornerRadius: Model.cornerRadius)
                  .frame(width: Model.width, height: Model.height)
                  .foregroundColor(model.backgroundColor)
              }
          }
      }
    )
    .buttonStyle(.plain)
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

  public func icon(_ icon: IconObject) -> View {
    let model = model.reinit(icon: icon)
    let intent = intent.reinit(model: model)
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

  public func onSelect(perform action: @escaping () -> Void) -> View {
    let model = model.reinit()
    let intent = intent.reinit(model: model, selectAction: action)
    return View(model: model, intent: intent)
  }
}

struct IconPickerOption_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var icon: IconObject

    let first: IconObject
    let last: IconObject

    var body: some View {
      PreviewBinding($icon) {
        PreviewSheet { toggle in
          IconPickerOption
            .render()
            .icon(first)
            .selection($icon)
            .colorTheme(.default)
            .onSelect {
              toggle()
            }
          IconPickerOption
            .render()
            .icon(last)
            .selection($icon)
            .colorTheme(.indigo)
            .onSelect {
              toggle()
            }
        }
      }
    }

    init() {
      let first = IconObject.default
      let last = IconObject(name: .airplane, type: .system)
      self.icon = first
      self.first = first
      self.last = last
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}