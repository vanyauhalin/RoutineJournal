import RoutineJournalCore
import SwiftUI

public struct MVITextField<Model>: SwiftUI.View where Model: MVITextFieldModel {
  public typealias View = MVITextField

  private let model: Model

  public var body: some SwiftUI.View {
    TextField(model.title, text: model.text)
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }

  public func text(_ text: Binding<String>) -> View {
    let model = model.reinit(text: text)
    return View(model: model)
  }
}

struct MVITextField_Previews: PreviewProvider {
  typealias ExampleField = MVITextField<ExampleFieldModel>

  final class ExampleFieldModel: MVITextFieldModel {
    let title = "Example Field"
    let text: Binding<String>

    init(text: Binding<String>) {
      self.text = text
    }
  }

  static var previews: some View {
    MVITextFieldPreview<ExampleFieldModel>()
  }
}
