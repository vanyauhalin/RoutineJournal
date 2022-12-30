import RoutineJournalCancellationModifier
import RoutineJournalConfirmationModifier
import RoutineJournalDeletionModifier

public final class CategoryDetailsIntent:
  CancellationModifier,
  ConfirmationModifier,
  DeletionModifier
{
  public typealias Model = CategoryDetailsModel

  public weak var model: Model?
  public var cancellationAction: (() -> Void)?
  public var confirmationAction: (() -> Void)?
  public var deletionAction: (() -> Void)?

  public init() {}
}
