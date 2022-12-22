import RoutineJournalColorThemeModifier
import RoutineJournalIconSelectionModifier
import RoutineJournalQueryModifier
import RoutineJournalSelectModifier

public final class IconPickerOptionsIntent:
  MVIIconSelectionModifierIntent,
  MVIColorThemeModifierIntent,
  MVIQueryModifierIntent,
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
