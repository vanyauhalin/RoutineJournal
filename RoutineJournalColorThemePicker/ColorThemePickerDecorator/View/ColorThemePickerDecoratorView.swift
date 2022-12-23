import RoutineJournalColorThemeModifier
import RoutineJournalCore
import SwiftUI

public struct ColorThemePickerDecoratorView: SwiftUI.View, MVColorThemeModifier {
  public typealias Model = ColorThemePickerDecoratorModel
  public typealias View = ColorThemePickerDecoratorView

  @ScaledMetric private var scale = 1

  public var model: Model

  public var width: Double {
    Model.width * scale
  }

  public var body: some SwiftUI.View {
    Circle()
      .frame(width: width)
      .foregroundColor(model.foregroundColor)
  }

  public init() {
    self.model = Model()
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }
}

struct ColorThemePickerDecoratorView_Previews: PreviewProvider {
  static var previews: some View {
    ColorThemePickerDecoratorView
      .render()
      .colorTheme(.indigo)
  }
}
