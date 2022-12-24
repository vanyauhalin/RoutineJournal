import RoutineJournalIconSelectionModifier
import RoutineJournalSelectModifier

public final class IconPickerOptionsIntent:
  MVIIconSelectionModifierIntent,
  MVISelectModifierIntent
{
  public typealias Model = IconPickerOptionsModel

  public weak var model: Model?

  public var selectAction: () -> Void

  public init() {
    self.selectAction = {}
  }

  public func onSelect() {
    selectAction()
  }
}
