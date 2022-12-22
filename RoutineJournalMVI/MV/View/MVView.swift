import SwiftUI

public protocol MVView: View {
  associatedtype Model: MVModel

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
