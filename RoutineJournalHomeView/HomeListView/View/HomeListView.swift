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

  public init() {
    self.model = Model()
  }
}

struct HomeListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .toolbar {
          HomeListView()
        }
    }
  }
}
