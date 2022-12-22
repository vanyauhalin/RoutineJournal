public protocol MVIModel: AnyObject {
  init()

  func reinit() -> Self
}

extension MVIModel {
  public func reinit() -> Self {
    self
  }
}
