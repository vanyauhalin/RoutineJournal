import RoutineJournalMVI

public final class ListItemCategoryFormStyleIntent: MVIIntent {
  public typealias Model = ListItemCategoryFormStyleModel

  public weak var model: Model?

  public init() {}

  public func onPress() {
    model?.showForm()
  }

  public func onConfirm() {
    model?.hideForm()
  }

  public func onCancel() {
    model?.hideForm()
  }
}
