import RoutineJournalCore
import SwiftUI

public struct IconView: View {
  public static let width: CGFloat = 28
  public static let height: CGFloat = 28
  public static let cornerRadius: CGFloat = 7

  public let icon: Icon
  public let foregroundColor: Color
  public let backgroundColor: Color

  @ScaledMetric public var scale = 1
  public var width: CGFloat {
    IconView.width * scale
  }
  public var height: CGFloat {
    IconView.height * scale
  }
  public var cornerRadius: CGFloat {
    IconView.cornerRadius * scale
  }

  public var body: some View {
    Image(systemName: icon.name.rawValue)
      .foregroundColor(foregroundColor)
      .frame(width: width, height: height)
      .background(
        RoundedRectangle(cornerRadius: cornerRadius)
          .foregroundColor(backgroundColor)
      )
  }

  public init(icon: Icon, foregroundColor: Color, backgroundColor: Color) {
    self.icon = icon
    self.foregroundColor = foregroundColor
    self.backgroundColor = backgroundColor
  }
}

struct IconView_Previews: PreviewProvider {
  static var previews: some View {
    IconView(
      icon: Icon(name: .airplane, type: .system),
      foregroundColor: .white,
      backgroundColor: .indigo
    )
  }
}
