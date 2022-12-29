import Combine
import Foundation

public final class NavigationButtonCategoryDetailsStyleModel: ObservableObject {
  @Published
  public var showingContent = false

  public init() {}

  public func showContent() {
    showingContent = true
  }

  public func hideContent() {
    showingContent = false
  }
}
