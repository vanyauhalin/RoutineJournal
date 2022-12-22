import RoutineJournalColorThemeModifier
import RoutineJournalIconModifier
import RoutineJournalIconSelectionModifier
import RoutineJournalSelectModifier

public final class IconPickerOptionIntent:
  MVIIconModifierIntent,
  MVIIconSelectionModifierIntent,
  MVIColorThemeModifierIntent,
  MVISelectModifierIntent
{
  public typealias Model = IconPickerOptionModel

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
