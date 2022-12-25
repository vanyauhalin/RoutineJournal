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
          HomeToday()
          HomeReport()
          HomeSettings()
        }
    }
  }

  public init() {
    self.model = Model()
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewData(self.name) {
      HomeView()
    }
  }
}
