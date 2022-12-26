import SwiftUI

extension View {
  @ViewBuilder
  public func `if`(
    _ condition: Bool
  ) -> some View {
    if condition {
      self
    }
  }

  @ViewBuilder
  public func `if`<Content>(
    _ condition: Bool,
    transform: (Self) -> Content
  ) -> some View
  where Content: View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}
