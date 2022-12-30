import SwiftUI

extension NavigationPicker {
  public struct Option: Identifiable {
    public let id: SelectionValue
    public let content: Content

    public init(id: SelectionValue, @ViewBuilder content: () -> Content) {
      self.id = id
      self.content = content()
    }
  }
}
