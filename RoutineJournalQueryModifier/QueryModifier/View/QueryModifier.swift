import SwiftUI

public protocol QueryModifier: AnyObject {
  func query(_ query: Binding<String>) -> Self
}
