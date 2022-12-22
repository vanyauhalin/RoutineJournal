import RoutineJournalCore
import SwiftUI

public struct IconView: SwiftUI.View {
  public typealias Model = IconModel
  public typealias View = IconView

  @ScaledMetric
  private var scale = 1

  private let model: Model

  public var width: Double {
    Model.width * scale
  }
  public var height: Double {
    Model.height * scale
  }
  public var cornerRadius: Double {
    Model.cornerRadius * scale
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
}

struct IconView_Previews: PreviewProvider {
  static var previews: some View {
    IconView
      .render()
      .icon(.default)
      .colorTheme(.indigo)
  }
}
