import SwiftUI

public struct HomeSettings: ToolbarContent {
  public typealias Model = HomeSettingsModel

  public var model: Model

  public var body: some ToolbarContent {
    ToolbarItemGroup(placement: .bottomBar) {
      NavigationLink(
        destination: {
          EmptyView()
        },
        label: {
          Text(Model.label)
        }
      )
    }
  }

  public init() {
    self.model = Model()
  }
}

struct HomeSettings_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .toolbar {
          HomeSettings()
        }
    }
  }
}
