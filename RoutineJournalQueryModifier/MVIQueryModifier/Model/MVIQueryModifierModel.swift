import SwiftUI

public protocol MVIQueryModifierModel: QueryModifierModel {}

extension MVIQueryModifierModel {
  public func reinit(query: Binding<String>) -> Self {
    self.query = query
    return self
  }
}
