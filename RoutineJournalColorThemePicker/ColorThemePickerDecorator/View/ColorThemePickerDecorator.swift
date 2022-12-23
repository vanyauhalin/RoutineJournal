import RoutineJournalColorThemeModifier
import SwiftUI

public struct ColorThemePickerDecorator: MVColorThemeModifier {
  public typealias Model = ColorThemePickerDecoratorModel

  @ScaledMetric
  private var scale = 1

  public var model: Model

  public var width: Double {
    Model.width * scale
  }

  public var body: some View {
    Circle()
      .frame(width: width)
      .foregroundColor(model.foregroundColor)
  }

  public init() {
    self.model = Model()
  }
}

struct ColorThemePickerDecorator_Previews: PreviewProvider {
  static var previews: some View {
    ColorThemePickerDecorator()
      .colorTheme(.indigo)
  }
}
