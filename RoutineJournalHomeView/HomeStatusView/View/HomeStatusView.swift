import SwiftUI

public struct HomeStatusView: SwiftUI.View {
  public typealias Model = HomeStatusModel
  public typealias View = HomeStatusView

  private let model: Model

  public var body: some SwiftUI.View {
    Color
      .clear
      .toolbar {
        ToolbarItem(placement: .status) {
          Text(model.status)
            .font(.footnote)
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

struct HomeStatusView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .background {
          HomeStatusView
            .render()
        }
    }
  }
}
