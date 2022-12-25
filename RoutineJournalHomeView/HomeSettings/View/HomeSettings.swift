import RoutineJournalMVI
import SwiftUI

public struct HomeSettings: MVView {
  public typealias Model = HomeSettingsModel

  public var model: Model

  public var body: some View {
    Color
      .clear
      .toolbar {
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
