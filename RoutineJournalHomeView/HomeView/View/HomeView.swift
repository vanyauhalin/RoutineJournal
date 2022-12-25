import RoutineJournalUI
import SwiftUI

public struct HomeView: SwiftUI.View {
  public typealias Model = HomeModel
  public typealias View = HomeView

  public let model: Model

  public var body: some SwiftUI.View {
    NavigationView {
      HomeTimelineView
        .render()
        .navigationTitle(model.navigationTitle)
        .toolbar {
          HomeCalendar()
          ToolbarItemGroup(placement: .navigationBarTrailing) {
            Rectangle()
              .frame(width: 0, height: 0)
              .hidden()
          }
          HomeEventForm()
          HomeSettings()
        }
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

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewData(self.name) {
      HomeView
        .render()
    }
  }
}
