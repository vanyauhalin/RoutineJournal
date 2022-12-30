import RoutineJournalUI
import SwiftUI

public struct EventFormNotesField: SwiftUI.View {
  public typealias Model = EventFormNotesModel
  public typealias View = EventFormNotesField

  private let model: Model

  public var body: some SwiftUI.View {
    if #available(iOS 16.0, *) {
      TextField(model.title, text: model.text, axis: .vertical)
        .lineLimit(6...)
    } else {
      TextField(model.title, text: model.text)
    }
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render(_ text: Binding<String>) -> View {
    let model = Model(text: text)
    return View(model: model)
  }
}

struct EventFormNotesField_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var notes = ""

    var body: some View {
      PreviewContext { _ in
        Form {
          EventFormNotesField
            .render($notes)
        }
      }
      .id(EventFormNotesField_Previews.name)
      .value(notes.description)
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
