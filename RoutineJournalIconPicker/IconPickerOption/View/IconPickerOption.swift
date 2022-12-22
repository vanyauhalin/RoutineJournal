import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconModifier
import RoutineJournalIconSelectionModifier
import RoutineJournalIconView
import RoutineJournalSelectModifier
import RoutineJournalUI
import SwiftUI

public struct IconPickerOption:
  SwiftUI.View,
  MVIIconModifier,
  MVIIconSelectionModifier,
  MVIColorThemeModifier,
  MVISelectModifier
{
  public typealias Intent = IconPickerOptionIntent
  public typealias Model = IconPickerOptionModel
  public typealias View = IconPickerOption

  public var model: Model
  public var intent: Intent

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

  public init() {
    let model = Model()
    let intent = Intent(model: model)
    self.model = model
    self.intent = intent
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
          IconPickerOption()
            .icon(first)
            .selection($icon)
            .colorTheme(.default)
            .onSelect {
              toggle()
            }
          IconPickerOption()
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
