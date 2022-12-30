public final class EventFormIntent {
  public typealias Model = EventFormModel

  private weak var model: Model?

  public var addAction: (Model) -> Void

  public init(model: Model, addAction: @escaping (Model) -> Void = { _ in }) {
    self.model = model
    self.addAction = addAction
  }

  public func onAdd() {
    guard let model else { return }
    addAction(model)
  }
}
