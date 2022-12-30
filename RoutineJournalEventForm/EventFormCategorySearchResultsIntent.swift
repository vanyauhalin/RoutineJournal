import RoutineJournalCore

public final class EventFormCategorySearchResultsIntent {
  public var selectionAction: (CategoryObject) -> Void

  public init(selectionAction: @escaping (CategoryObject) -> Void = { _ in }) {
    self.selectionAction = selectionAction
  }

  public func onSelect(object: CategoryObject) {
    selectionAction(object)
  }
}
