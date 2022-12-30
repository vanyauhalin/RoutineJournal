import RoutineJournalTimeline
import RoutineJournalUI
import SwiftUI

public struct HomeTimelineView: SwiftUI.View {
  public typealias Model = HomeTimelineModel
  public typealias View = HomeTimelineView

  @ObservedObject private var model: Model

  public var body: some SwiftUI.View {
    ScrollView {
      VStack(spacing: 8) {
        if let events = model.events {
          ForEach(events) { event in
            TimelineItemView
              .render(event)
          }
        }
      }
      .padding([.horizontal])
    }
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }
}

struct HomeTimelineView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { _ in
      HomeTimelineView
        .render()
    }
    .id(name)
    .modifier(.data)
  }
}
