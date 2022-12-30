public final class EventFormCategoryIntent {
  public typealias Model = EventFormCategoryModel

  private weak var model: Model?

  public init(model: Model) {
    self.model = model
  }

  public func onTap() {
    model?.showSearch()
  }
}
