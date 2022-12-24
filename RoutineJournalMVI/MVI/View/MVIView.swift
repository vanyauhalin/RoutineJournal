import SwiftUI

public protocol MVIView: View {
  associatedtype Intent: MVIIntent
  associatedtype Model: AnyObject

  var model: Model { get set }
  var intent: Intent { get set }

  init()
  init(model: Model, intent: Intent)
}

extension MVIView {
  public init(model: Model, intent: Intent) {
    self.init()
    self.model = model
    self.intent = intent
  }
}
