import SwiftUI

public protocol MVView: View {
  associatedtype Model: MVIModel

  var model: Model { get set }

  init()
  init(model: Model)
}

extension MVView {
  public init(model: Model) {
    self.init()
    self.model = model
  }
}
