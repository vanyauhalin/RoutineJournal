import Combine
import Foundation

public final class HomeEventFormModel: ObservableObject {
  public typealias Model = HomeEventFormModel

  public let iconName = "plus"

  @Published public var showing = false

  public init() {}
}
