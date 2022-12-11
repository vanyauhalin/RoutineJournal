import RoutineJournalCore
import SwiftUI

public struct TimelineItemTitleView: SwiftUI.View {
  public typealias Model = TimelineItemTitleModel
  public typealias View = TimelineItemTitleView

  private let model: Model

  public var body: some SwiftUI.View {
    Text(model.text)
      .font(.headline)
      .lineLimit(1)
      .foregroundColor(model.colors.foregroundColor)
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render(_ text: String) -> View {
    let model = Model(from: text)
    return View(model: model)
  }

  public func colorTheme(_ colorTheme: ColorTheme) -> View {
    model.update(colorTheme: colorTheme)
    return View(model: model)
  }
}

struct TimelineItemTitleView_Previews: PreviewProvider {
  static var previews: some View {
    TimelineItemTitleView
      .render("Timeline Item Title")
      .colorTheme(.indigo)
  }
}
