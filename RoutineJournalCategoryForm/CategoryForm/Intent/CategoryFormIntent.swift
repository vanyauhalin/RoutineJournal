public final class CategoryFormIntent {
  public typealias Model = CategoryFormModel

  private weak var model: Model?

  public init(model: Model) {
    self.model = model
  }

  public func onCancel() {}

  public func onConfirm() {}
}
