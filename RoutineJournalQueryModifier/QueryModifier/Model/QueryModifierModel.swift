import SwiftUI

public protocol QueryModifierModel: AnyObject {
  var query: Binding<String> { get set }

  func reinit(query: Binding<String>) -> Self
}
