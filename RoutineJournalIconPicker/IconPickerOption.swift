import RoutineJournalCore
import RoutineJournalIconView
import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct IconPickerOption: MVIView {
  public typealias Model = IconPickerOptionModel
  public typealias Intent = IconPickerOptionIntent

  public var model: Model
  public var intent: Intent

  public var body: some View {
    Button(
      action: {
        intent.onSelect()
      },
      label: {
        IconView()
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
      PreviewContext { context in
        VStack {
          IconPickerOption()
            .icon(first)
            .selection($icon)
            .colorTheme(.default)
            .onSelect {
              context.dismiss()
            }
          IconPickerOption()
            .icon(last)
            .selection($icon)
            .colorTheme(.indigo)
            .onSelect {
              context.dismiss()
            }
        }
      }
      .id(IconPickerOption_Previews.name)
      .modifier(.sheet)
      .value(icon.name.rawValue)
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
