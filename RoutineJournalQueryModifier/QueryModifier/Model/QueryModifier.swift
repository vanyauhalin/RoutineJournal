import SwiftUI

public protocol QueryModifier: AnyObject {
  var query: Binding<String> { get set }

  func reinit(query: Binding<String>) -> Self
}

extension QueryModifier {
  public func reinit(query: Binding<String>) -> Self {
    self.query = query
    return self
  }
}
