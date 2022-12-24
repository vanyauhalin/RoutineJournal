import RoutineJournalIconSelectionModifier

public final class IconPickerIntent: MVIIconSelectionModifierIntent {
  public typealias Model = IconPickerModel

  public weak var model: Model?

  public init() {}

  public func onPress() {
    model?.showExplorer()
  }
}
