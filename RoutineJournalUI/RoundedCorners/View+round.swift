import SwiftUI

extension View {
  public func round(
    _ corners: UIRectCorner = .allCorners,
    radius: Double
  ) -> some View {
    clipShape(RoundedCorners(corners: corners, radius: radius))
  }
}
