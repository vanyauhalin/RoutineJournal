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
}

struct ColorThemePickerDecoratorView_Previews: PreviewProvider {
  static var previews: some View {
    ColorThemePickerDecoratorView()
      .colorTheme(.indigo)
  }
}
