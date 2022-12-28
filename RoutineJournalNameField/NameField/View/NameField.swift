import RoutineJournalMVI
import RoutineJournalUI
import SwiftUI

public struct NameField: MVView {
  public typealias Model = NameFieldModel

  public var model: Model

  public var body: some View {
    TextField(Model.title, text: model.text)
  }

  public init() {
    self.model = Model()
  }
}

struct NameField_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var text = String.default

    var body: some View {
      PreviewContext { _ in
        Form {
          NameField()
            .text($text)
        }
      }
      .id(NameField_Previews.name)
      .value(text)
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
