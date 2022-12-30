public final class EventFormEndsIntent {
  public typealias Model = EventFormEndsModel

  private weak var model: Model?

  public init(model: Model) {
    self.model = model
  }

  public func onAdd() {
    model?.updateSelection()
  }

  public func onDelete() {
    model?.resetSelection()
  }
}
