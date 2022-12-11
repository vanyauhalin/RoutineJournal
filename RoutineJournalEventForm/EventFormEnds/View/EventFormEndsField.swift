import SwiftUI

public struct EventFormEndsField: SwiftUI.View {
  public typealias Intent = EventFormEndsIntent
  public typealias Model = EventFormEndsModel
  public typealias View = EventFormEndsField

  private let model: Model
  private let intent: Intent

  public var body: some SwiftUI.View {
    if model.selection.wrappedValue.timeIntervalSince1970.isZero {
      Button(
        action: {
          intent.onAdd()
        },
        label: {
          HStack(spacing: .zero) {
            Text(model.title)
            Spacer(minLength: 8)
            Image(systemName: "plus.circle")
          }
        }
      )
    } else {
      ForEach(0..<1) { _ in
        DatePicker(
          model.title,
          selection: model.selection,
          displayedComponents: [.date, .hourAndMinute]
        )
      }
      .onDelete { _ in
        intent.onDelete()
      }
    }
  }

  public init(model: Model, intent: Intent) {
    self.model = model
    self.intent = intent
  }

  public static func render(_ selection: Binding<Date>) -> View {
    let model = Model(selection: selection)
    let intent = Intent(model: model)
    return View(model: model, intent: intent)
  }
}

struct EventFormEndsField_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var date = Date.now

    var body: some View {
      Form {
        Section {
          EventFormEndsField
            .render($date)
        }
        Section {
          Text(date.description)
        }
      }
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
