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

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }

  public func icon(_ icon: IconObject) -> View {
    let model = model.reinit(icon: icon)
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

struct IconView_Previews: PreviewProvider {
  static var previews: some View {
    IconView
      .render()
      .icon(.default)
      .colorTheme(.indigo)
      .size(.medium)
  }
}
