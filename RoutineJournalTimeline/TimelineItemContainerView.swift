import RoutineJournalCore
import SwiftUI

public struct TimelineItemContainerView<Content>: SwiftUI.View
where Content: SwiftUI.View {
  public typealias Model = TimelineItemContainerModel
  public typealias View = TimelineItemContainerView

  private let model: Model
  public let content: Content

  public var body: some SwiftUI.View {
    content
      .padding([.horizontal])
      .padding([.vertical], 8)
      .background {
        Rectangle()
          .foregroundColor(model.colors.backgroundColor)
          .cornerRadius(10)
      }
  }

  public init(model: Model, @ViewBuilder content: () -> Content) {
    self.model = model
    self.content = content()
  }

  public static func render(@ViewBuilder content: () -> Content) -> View {
    let model = Model()
    return View(model: model, content: content)
  }

  public func colorTheme(_ colorTheme: ColorTheme) -> View {
    model.update(colorTheme: colorTheme)
    return View(model: model) {
      content
    }
  }
}

struct TimelineItemContainerView_Previews: PreviewProvider {
  static var previews: some View {
    TimelineItemContainerView
      .render {
        Text("Inside")
      }
      .colorTheme(.indigo)
  }
}
