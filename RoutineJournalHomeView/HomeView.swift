import RoutineJournalUI
import SwiftUI

public struct HomeView: View {
  public typealias Model = HomeModel

  public let model: Model

  public var body: some View {
    NavigationView {
      HomeTimelineView
        .render()
        .navigationTitle(Model.title)
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
    PreviewContext { _ in
      HomeView()
    }
    .id(name)
    .modifier(.data)
  }
}
