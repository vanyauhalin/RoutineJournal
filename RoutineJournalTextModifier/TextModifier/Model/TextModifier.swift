import SwiftUI

public protocol TextModifier: AnyObject {
  var text: Binding<String> { get set }

  func reinit(text: Binding<String>) -> Self
}

extension TextModifier {
  public func reinit(text: Binding<String>) -> Self {
    self.text = text
    return self
  }
}
