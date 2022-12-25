import SwiftUI

public struct HomeReport: ToolbarContent {
  public typealias Model = HomeReportModel

  public var model: Model

  public var body: some ToolbarContent {
    ToolbarItemGroup(placement: .bottomBar) {
      Text(Model.label)
        .opacity(0.1)
    }
  }

  public init() {
    self.model = Model()
  }
}

struct HomeReport_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .toolbar {
          HomeToday()
        }
    }
  }
}
