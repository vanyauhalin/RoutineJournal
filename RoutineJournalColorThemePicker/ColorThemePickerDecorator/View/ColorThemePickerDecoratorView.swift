import RoutineJournalCore
import SwiftUI

public struct ColorThemePickerDecoratorView: SwiftUI.View {
  public typealias Model = ColorThemePickerDecoratorModel
  public typealias View = ColorThemePickerDecoratorView

  private let model: Model
  @ScaledMetric private var scale = 1

  public var width: Double {
    model.size.width * scale
  }

  public var body: some SwiftUI.View {
    Circle()
      .frame(width: width)
      .foregroundColor(model.colors.foregroundColor)
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }

  public func colorTheme(_ colorTheme: ColorTheme) -> View {
    let model = model.reinit(colorTheme: colorTheme)
    return View(model: model)
  }

  public func size(_ size: Model.Size) -> View {
    let model = model.reinit(size: size)
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
