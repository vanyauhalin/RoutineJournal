public protocol MVIIntent: AnyObject {
  associatedtype Model: AnyObject

  var model: Model? { get set }

  init()
  init(model: Model)

  func reinit(model: Model) -> Self
}

extension MVIIntent {
  public init(model: Model) {
    self.init()
    self.model = model
  }

  public func reinit(model: Model) -> Self {
    self.model = model
    return self
  }
}
