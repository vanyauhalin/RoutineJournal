import Combine
import Foundation

public final class HomeCategoryFormModel: ObservableObject {
  public typealias Model = HomeCategoryFormModel

  public let iconName = "tag"

  @Published public var showing = false

  public init() {}

  public func reinit() -> Model {
    Model()
  }
}
