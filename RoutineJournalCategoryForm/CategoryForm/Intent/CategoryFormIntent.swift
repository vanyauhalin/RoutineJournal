import RoutineJournalCancellationModifier
import RoutineJournalOnConfirmModifier

public final class CategoryFormIntent: CancellationModifier, OnConfirmModifier {
  public typealias Model = CategoryFormModel

  public weak var model: Model?
  public var actionOnCancel: (() -> Void)?
  public var actionOnConfirm: (() -> Void)?

  public init() {}
}
