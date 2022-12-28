import RoutineJournalCore

public final class EventFormCategorySearchResultsIntent {
  public var actionOnSelect: (CategoryObject) -> Void

  public init(actionOnSelect: @escaping (CategoryObject) -> Void = { _ in }) {
    self.actionOnSelect = actionOnSelect
  }

  public func onSelect(object: CategoryObject) {
    actionOnSelect(object)
  }
}
