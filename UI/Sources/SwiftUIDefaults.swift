import SwiftUI

public struct SwiftUIDefaults {
  let padding: CGFloat
}

public extension SwiftUIDefaults {
  static let current = SwiftUIDefaults(padding: 16)
}
