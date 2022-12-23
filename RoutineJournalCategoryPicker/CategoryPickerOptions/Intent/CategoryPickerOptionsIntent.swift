import RoutineJournalCategorySelectionModifier
import RoutineJournalQueryModifier
import RoutineJournalSelectModifier

public final class CategoryPickerOptionsIntent:
  MVICategorySelectionModifierIntent,
  MVIQueryModifierIntent,
  MVISelectModifierIntent
{
  public typealias Model = CategoryPickerOptionsModel

  public weak var model: Model?
  public var selectAction: () -> Void

  public init() {
    self.selectAction = {}
  }

  public func onSelect() {
    selectAction()
  }
}
