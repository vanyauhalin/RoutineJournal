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
  public typealias Intent = IconPickerOptionsIntent
  public typealias Model = IconPickerOptionsModel

  public weak var model: Model?

  public var selectAction: () -> Void

  public init() {
    self.selectAction = {}
  }

  public init(selectAction: @escaping () -> Void = {}) {
    self.selectAction = selectAction
  }

  public func reinit(selectAction: (() -> Void)? = nil) -> Intent {
    Intent(selectAction: selectAction ?? self.selectAction)
  }

  public func onSelect() {
    selectAction()
  }
}
