import Foundation
import Swift

public enum IconName: String {
  case airplane = "airplane"
  case cart = "cart.fill"
}

public enum IconType {
  case custom
  case system
}

public struct Icon {
  public let name: String
  public let type: IconType
}

public extension Icon {
  static let airplane = Icon(name: IconName.airplane.rawValue, type: .system)
  static let cart = Icon(name: IconName.cart.rawValue, type: .system)
}
