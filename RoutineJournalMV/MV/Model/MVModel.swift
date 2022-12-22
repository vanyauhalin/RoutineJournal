public protocol MVModel: AnyObject {
  init()

  func reinit() -> Self
}

extension MVModel {
  public func reinit() -> Self {
    self
  }
}
