import RoutineJournalCore

public final class EventFormCategorySearchResultsIntent {
  public var selectAction: (CategoryObject) -> Void

  public init(selectAction: @escaping (CategoryObject) -> Void = { _ in }) {
    self.selectAction = selectAction
  }

  public func onSelect(object: CategoryObject) {
    selectAction(object)
  }
}
