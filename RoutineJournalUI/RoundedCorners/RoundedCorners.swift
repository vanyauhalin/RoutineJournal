import SwiftUI

public struct RoundedCorners: Shape {
  public let corners: UIRectCorner
  public let radius: Double

  public var radii: CGSize {
    CGSize(width: radius, height: radius)
  }

  public init(corners: UIRectCorner = .allCorners, radius: Double = .zero) {
    self.corners = corners
    self.radius = radius
  }

  public func path(in rect: CGRect) -> Path {
    Path(
      UIBezierPath(
        roundedRect: rect,
        byRoundingCorners: corners,
        cornerRadii: radii
      )
      .cgPath
    )
  }
}

struct RoundedCorner_Previews: PreviewProvider {
  static var previews: some View {
    Rectangle()
      .frame(width: 200, height: 80)
      .round(radius: 20)
  }
}
