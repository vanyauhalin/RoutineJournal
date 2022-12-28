import RoutineJournalOnCancelModifier

public final class CategoryFormIntent: OnCancelModifier {
  public typealias Model = CategoryFormModel

  public weak var model: Model?
  public var actionOnCancel: () -> Void

  public init() {
    self.actionOnCancel = {}
  }

  public func onConfirm() {}
}
