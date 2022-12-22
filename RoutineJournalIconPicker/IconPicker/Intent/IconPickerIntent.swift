import RoutineJournalColorThemeModifier
import RoutineJournalIconSelectionModifier

public final class IconPickerIntent:
  MVIIconSelectionModifierIntent,
  MVIColorThemeModifierIntent
{
  public typealias Model = IconPickerModel

  public weak var model: Model?

  public init() {}

  public func onPress() {
    model?.showExplorer()
  }
}
