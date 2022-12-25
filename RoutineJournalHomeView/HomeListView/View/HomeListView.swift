import SwiftUI

public struct HomeListView: ToolbarContent {
  public typealias Model = HomeListModel
  public typealias View = HomeListView

  private let model: Model

  public var body: some ToolbarContent {
    ToolbarItemGroup(placement: .navigationBarTrailing) {
      Image(systemName: Model.systemName)
        .opacity(0.1)
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
        .toolbar {
          HomeListView
            .render()
        }
    }
  }
}
