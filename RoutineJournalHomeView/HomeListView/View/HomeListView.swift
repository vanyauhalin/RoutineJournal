import SwiftUI

public struct HomeListView: SwiftUI.View {
  public typealias Model = HomeListModel
  public typealias View = HomeListView

  private let model: Model

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

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }
}

struct HomeListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .background {
          HomeListView
            .render()
        }
    }
  }
}
