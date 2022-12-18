import SwiftUI

private struct NavigationPickerOptionPositionEnvironmentKey: EnvironmentKey {
  static let defaultValue = NavigationPickerOptionPosition.destination
}

extension EnvironmentValues {
  public var navigationPickerOptionPosition: NavigationPickerOptionPosition {
    get {
      self[NavigationPickerOptionPositionEnvironmentKey.self]
    }
    set {
      self[NavigationPickerOptionPositionEnvironmentKey.self] = newValue
    }
  }
}
