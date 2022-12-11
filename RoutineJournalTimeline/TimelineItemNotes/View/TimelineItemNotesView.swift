import RoutineJournalCore
import SwiftUI

public struct TimelineItemNotesView: SwiftUI.View {
  public typealias Model = TimelineItemNotesModel
  public typealias View = TimelineItemNotesView

  private let model: Model

  public var body: some SwiftUI.View {
    Text(model.text)
      .font(.subheadline)
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

struct TimelineItemNotesView_Previews: PreviewProvider {
  static var previews: some View {
    TimelineItemNotesView
      .render("Timeline item notes")
      .colorTheme(.indigo)
  }
}
