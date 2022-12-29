#if DEBUG
extension PreviewContext {
  public final class Model {
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
    public var counterApplied: Bool {
      modifiers.contains(.counter)
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

    public func reinit(modifiers: [Modifier]) -> Self {
      modifiers.forEach { modifier in
        self.modifiers.insert(modifier)
      }
      return self
    }

    public func reinit(value: String?) -> Self {
      values.append(value)
      return self
    }

    public func reinit(values: [String?]) -> Self {
      values.forEach { value in
        self.values.append(value)
      }
      return self
    }
  }
}
#endif
