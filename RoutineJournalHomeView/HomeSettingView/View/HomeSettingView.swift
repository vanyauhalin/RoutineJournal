import RoutineJournalMVI
import SwiftUI

public struct HomeSettingView: MVView {
  public typealias Model = HomeSettingModel
  public typealias View = HomeSettingView

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

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }
}

struct HomeSettingView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .background {
          HomeSettingView
            .render()
        }
    }
  }
}
