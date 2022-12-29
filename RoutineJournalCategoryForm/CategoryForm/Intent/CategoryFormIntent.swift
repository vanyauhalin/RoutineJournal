import RoutineJournalCancellationModifier
import RoutineJournalConfirmationModifier

public final class CategoryFormIntent:
  CancellationModifier,
  ConfirmationModifier
{
  public typealias Model = CategoryFormModel

  public weak var model: Model?
  public var cancellationAction: (() -> Void)?
  public var confirmationAction: (() -> Void)?

  public init() {}
}
