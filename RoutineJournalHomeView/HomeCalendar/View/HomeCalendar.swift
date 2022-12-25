import SwiftUI

public struct HomeCalendar: ToolbarContent {
  public typealias Model = HomeCalendarModel

  private let model: Model

  public var body: some ToolbarContent {
    ToolbarItemGroup(placement: .navigationBarTrailing) {
      Image(systemName: Model.systemName)
        .opacity(0.1)
    }
  }

  public init() {
    self.model = Model()
  }
}

struct HomeCalendar_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .toolbar {
          HomeCalendar()
        }
    }
  }
}
