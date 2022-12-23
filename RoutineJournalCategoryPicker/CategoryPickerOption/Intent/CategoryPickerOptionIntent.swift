import RoutineJournalCategoryModifier
import RoutineJournalCategorySelectionModifier
import RoutineJournalSelectModifier

public final class CategoryPickerOptionIntent:
  MVICategoryModifierIntent,
  MVICategorySelectionModifierIntent,
  MVISelectModifierIntent
{
  public typealias Model = CategoryPickerOptionModel

  public weak var model: Model?
  public var selectAction: () -> Void

  public init() {
    self.selectAction = {}
  }

  public func onSelect() {
    model?.select()
    selectAction()
  }
}
