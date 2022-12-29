import RoutineJournalCancellationModifier
import RoutineJournalOnConfirmModifier

public final class CategoryFormIntent: CancellationModifier, OnConfirmModifier {
  public typealias Model = CategoryFormModel

  public weak var model: Model?
  public var cancellationAction: (() -> Void)?
  public var actionOnConfirm: (() -> Void)?

  public init() {}
}
