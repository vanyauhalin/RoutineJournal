import RoutineJournalUI
import SwiftUI

public struct EventFormTitleField: SwiftUI.View {
  public typealias Model = EventFormTitleModel
  public typealias View = EventFormTitleField

  private let model: Model

  public var body: some SwiftUI.View {
    TextField(model.title, text: model.text)
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render(_ text: Binding<String>) -> View {
    let model = Model(text: text)
    return View(model: model)
  }
}

struct EventFormTitleField_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var title = ""

    var body: some View {
      PreviewContext { _ in
        Form {
          EventFormTitleField
            .render($title)
        }
      }
      .id(EventFormTitleField_Previews.name)
      .value(title.description)
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
