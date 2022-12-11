import SwiftUI

public struct EventFormStartsField: SwiftUI.View {
  public typealias Model = EventFormStartsModel
  public typealias View = EventFormStartsField

  private let model: Model

  public var body: some SwiftUI.View {
    DatePicker(
      model.title,
      selection: model.selection,
      displayedComponents: [.date, .hourAndMinute]
    )
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render(_ selection: Binding<Date>) -> View {
    let model = Model(selection: selection)
    return View(model: model)
  }
}

struct EventFormStartsField_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var date = Date.now

    var body: some View {
      Form {
        Section {
          EventFormStartsField
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
