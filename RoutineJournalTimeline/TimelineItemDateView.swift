import RoutineJournalCore
import SwiftUI

public struct TimelineItemDateView<Model>: SwiftUI.View
where Model: TimelineItemDateModelProtocol {
  public typealias View = TimelineItemDateView

  private let model: Model

  public var body: some SwiftUI.View {
    HStack(spacing: .zero) {
      ForEach(
        Array(model.charactersWithWidth.enumerated()),
        id: \.offset
      ) { _, characterWithWidth in
        Text(characterWithWidth.0)
          .frame(width: characterWithWidth.1, alignment: .center)
          .font(.subheadline)
          .foregroundColor(model.colors.foregroundColor)
      }
    }
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render(_ date: Foundation.Date) -> View {
    let model = Model(from: date, colorTheme: .neutral)
    return View(model: model)
  }

  public func colorTheme(_ colorTheme: ColorTheme) -> View {
    model.update(colorTheme: colorTheme)
    return View(model: model)
  }
}
