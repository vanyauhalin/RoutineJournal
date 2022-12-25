import RoutineJournalMVI
import SwiftUI

public struct HomeSettings: MVView {
  public typealias Model = HomeSettingsModel
  public typealias View = HomeSettings

  public var model: Model

  public var body: some SwiftUI.View {
    Color
      .clear
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Image(systemName: model.iconName)
            .opacity(0.1)
        }
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
        .background {
          HomeSettings()
        }
    }
  }
}
