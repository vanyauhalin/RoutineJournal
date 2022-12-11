import RoutineJournalCore

public final class EventFormCategorySearchIntent {
  public typealias Model = EventFormCategorySearchModel

  private weak var model: Model?

  public init(model: Model) {
    self.model = model
  }

  public func onSelect(object: CategoryObject) {
    model?.update(object: object)
  }
}
