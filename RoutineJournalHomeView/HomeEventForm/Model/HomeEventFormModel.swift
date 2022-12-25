import Combine
import Foundation

public final class HomeEventFormModel: ObservableObject {
  public let iconName = "plus"

  @Published
  public var showing = false

  public init() {}

  public func show() {
    showing = true
  }
}
