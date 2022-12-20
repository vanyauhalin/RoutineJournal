import RoutineJournalCore
import SwiftUI

public struct IconView: SwiftUI.View {
  public typealias Model = IconModel
  public typealias View = IconView

  private let model: Model

  @ScaledMetric private var scale = 1
  public var width: Double {
    model.size.width * scale
  }
  public var height: Double {
    model.size.height * scale
  }
  public var cornerRadius: Double {
    model.size.cornerRadius * scale
  }

  public var body: some SwiftUI.View {
    Image(systemName: model.systemName)
      .foregroundColor(model.colors.foregroundColor)
      .frame(width: width, height: height)
      .background(
        RoundedRectangle(cornerRadius: cornerRadius)
          .foregroundColor(model.colors.backgroundColor)
      )
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render(_ icon: IconObject) -> View {
    let model = Model(icon: icon)
    return View(model: model)
  }

  public func size(_ size: Model.Size) -> View {
    // model.update(size: size)
    return View(model: model)
  }

  public func colorTheme(_ colorTheme: ColorTheme) -> View {
    // model.update(colorTheme: colorTheme)
    return View(model: model)
  }
}

struct IconView_Previews: PreviewProvider {
  static var previews: some View {
    IconView
      .render(IconObject(name: .airplane, type: .system))
      .size(.medium)
      .colorTheme(.indigo)
  }
}
