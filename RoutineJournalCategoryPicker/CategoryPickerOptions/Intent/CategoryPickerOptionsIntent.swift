import RoutineJournalCategorySelectionModifier
import RoutineJournalSelectModifier

public final class CategoryPickerOptionsIntent:
  MVICategorySelectionModifierIntent,
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
