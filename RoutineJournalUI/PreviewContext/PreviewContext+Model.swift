#if DEBUG
import Combine
import Foundation

extension PreviewContext {
  public final class Model {
    private var subscriptions = Set<AnyCancellable>()

    public var identifier: String
    public var position: Position
    public var modifiers: Set<Modifier>
    public var values: [String?]

    public var dataApplied: Bool {
      modifiers.contains(.data)
    }
    public var sheetApplied: Bool {
      modifiers.contains(.sheet)
    }

    public init() {
      self.identifier = "Unknown Preview Context"
      self.position = (.top, .leading)
      self.modifiers = Set()
      self.values = []
    }

    public func reinit(identifier: String) -> Self {
      self.identifier = identifier
      return self
    }

    public func reinit(position: Position) -> Self {
      self.position = position
      return self
    }

    public func reinit(modifier: Modifier) -> Self {
      modifiers.insert(modifier)
      return self
    }

    public func reinit(value: String?) -> Self {
      values.append(value)
      return self
    }
  }
}
#endif
