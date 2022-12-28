import RoutineJournalOnCancelModifier
import RoutineJournalOnConfirmModifier

public final class CategoryFormIntent: OnCancelModifier, OnConfirmModifier {
  public typealias Model = CategoryFormModel

  public weak var model: Model?
  public var actionOnCancel: (() -> Void)?
  public var actionOnConfirm: () -> Void

  public init() {
    self.actionOnConfirm = {}
  }
}
