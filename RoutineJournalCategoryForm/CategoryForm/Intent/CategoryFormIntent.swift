import RoutineJournalMVI

public final class CategoryFormIntent: MVIIntent {
  public typealias Model = CategoryFormModel

  public weak var model: Model?

  public init() {}

  public func onCancel() {}

  public func onConfirm() {}
}
