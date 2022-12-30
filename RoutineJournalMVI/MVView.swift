import SwiftUI

public protocol MVView: View {
  associatedtype Model: AnyObject

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
