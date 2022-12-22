import SwiftUI

public protocol QueryModifier {
  func query(_ query: Binding<String>) -> Self
}
